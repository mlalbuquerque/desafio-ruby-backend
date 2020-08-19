module Api
  class Google
    def self.url_in(request)
      [
        Rails.configuration.google[:url][:login], '?',
        CGI.unescape(login_params(request).to_query)
      ].join
    end

    def self.auth(options = {})
      data = Rails.configuration.google[:auth].clone
      data[:code] = options[:code]
      data[:redirect_uri] = redirect_uri(options)
      curl(
        method: :post,
        json: true,
        url: Rails.configuration.google[:url][:auth],
        data: data
      )
    end

    def self.info(options = {})
      cmd = "curl -s -X GET '#{Rails.configuration.google[:url][:info]}'"
      cmd << "?access_token=#{options[:access_token] || options[:user].token}"
      JSON.parse(
        `#{cmd}`
      ).deep_symbolize_keys
    end

    class << self
      private

      def redirect_uri(options = {})
        request = options[:request]
        uri = request.protocol + request.host_with_port
        uri + Rails.configuration.google[:url][:callback]
      end

      def login_params(request)
        params = Rails.configuration.google[:url][:params_login]
        params[:redirect_uri] = redirect_uri(request: request)
        params
      end

      def setup_url(options = {})
        cmd = ''
        cmd.concat ' --request POST' if options[:method] == :post
        cmd.concat ' -x GET' if options[:method] == :get
        cmd.concat " --header 'content-type:application/json'" if options[:json]
        cmd.concat " --data '#{options[:data].to_json}'" if options[:data]
      end

      def curl(options = {})
        url = options[:url]
        url << "?#{CGI.unescape(options[:params].to_query)}" if options[:params]
        cmd = " --url '#{url}'"
        cmd << setup_url(options)
        cmd = %(curl -s #{cmd})
        response = `#{cmd}`
        JSON.parse(response).deep_symbolize_keys
      end
    end
  end
end
