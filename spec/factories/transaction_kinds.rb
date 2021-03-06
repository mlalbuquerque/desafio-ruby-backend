# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_kind do
    code { 'MyString' }
    description { 'MyString' }
    nature { 'MyString' }
  end
end
