# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    customer
    number { Faker::Finance.credit_card }
  end
end
