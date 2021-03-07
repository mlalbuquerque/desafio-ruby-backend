# frozen_string_literal: true

module Admin
  class FinancialEntriesController < ::Admin::BaseController
    def index
      @financial_entries = query.paginate(params[:page])
    end

    def new
      @financial_entry = query.build
    end

    def create
      service = ImportCNBAFileService.call(financial_entry_params)

      if service.success?
        flash[:success] = t('controllers.create.success')

        redirect_to admin_root_path
      else
        @financial_entry = service.financial_entry
        render :new
      end
    end

    private

    def query
      @query ||= FinancialEntriesQuery.new
    end

    def financial_entry_params
      params.require(:financial_entry)
            .permit(:user_id)
            .merge(content_file: content_file)
    end

    def content_file
      return if tempfile.blank?

      File.open(tempfile).read
    end

    def tempfile
      params.dig(:financial_entry, :content_file)&.tempfile
    end
  end
end
