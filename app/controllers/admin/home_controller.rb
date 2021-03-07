# frozen_string_literal: true

module Admin
  class HomeController < ::Admin::BaseController
    def index
      @transactions = query.paginate(params[:page])
    end

    private

    def query
      @query ||= TransactionsQuery.new
    end
  end
end
