# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    credit_card { nil }
    store { nil }
    kind { 'MyString' }
    occurred_at { '2021-03-05 23:33:15' }
    amount { '9.99' }
  end
end
