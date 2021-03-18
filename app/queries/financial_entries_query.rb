# frozen_string_literal: true

class FinancialEntriesQuery < ApplicationQuery
  def initialize
    @relation = FinancialEntry.order(created_at: :desc)
  end

  def includes
    @relation = relation.includes(:user)

    self
  end
end
