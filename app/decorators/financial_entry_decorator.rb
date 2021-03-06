# frozen_string_literal: true

module FinancialEntryDecorator
  delegate :name, to: :user, allow_nil: true, prefix: true

  def created_date
    l(created_at, format: :short)
  end
end
