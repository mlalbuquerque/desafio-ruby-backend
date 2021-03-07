# frozen_string_literal: true

module TransactionDecorator
  delegate :description, :nature_humanize,
           to: :kind, allow_nil: true, prefix: true
  delegate :number, to: :credit_card, allow_nil: true, prefix: true
  delegate :name, :responsible_name, to: :store, allow_nil: true, prefix: true
  delegate :ssn, to: :customer, allow_nil: true, prefix: true
  delegate :name, to: :user, allow_nil: true, prefix: true

  def occurred_date
    l(occurred_at, format: :short)
  end

  def formatted_amount
    number_to_currency(amount)
  end
end
