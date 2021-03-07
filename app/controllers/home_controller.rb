# frozen_string_literal: true

class HomeController < AuthController
  def index
    @transactions = query.paginate(params[:page])
  end

  private

  def query
    @query ||= TransactionsQuery.new.by_user(current_user.id)
  end
end
