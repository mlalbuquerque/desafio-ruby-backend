# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_kind do
    code { Faker::Code.ean }
    description { Faker::Lorem.word }
    nature { TransactionKindNature.sample }
  end
end
