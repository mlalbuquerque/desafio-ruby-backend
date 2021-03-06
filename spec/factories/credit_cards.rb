# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    customer { nil }
    number { 'MyString' }
  end
end
