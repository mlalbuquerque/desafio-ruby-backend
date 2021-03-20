Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
      expose: ['access-token', 'token-type', 'uid', 'client'],
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end