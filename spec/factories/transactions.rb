# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    user
    credit_card
    store
    kind factory: :transaction_kind
    occurred_at { Faker::Date.between(from: 2.days.ago, to: Date.current) }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
