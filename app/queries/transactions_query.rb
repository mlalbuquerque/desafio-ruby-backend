# frozen_string_literal: true

class TransactionsQuery < ApplicationQuery
  def initialize
    @relation = Transaction.all
  end

  def includes
    @relation = relation.includes(:kind, :store, :credit_card, :customer)

    self
  end

  def user_includes
    @relation = relation.includes(:user)

    self
  end

  def by_user(user_id)
    @relation = relation.where(user_id: user_id)

    self
  end
end
