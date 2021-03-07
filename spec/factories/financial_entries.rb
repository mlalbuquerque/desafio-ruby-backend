# frozen_string_literal: true

FactoryBot.define do
  factory :financial_entry do
    user
    content_file { Rack::Test::UploadedFile.new('./CNAB.txt', 'text/txt') }

    trait :invalid do
      user_id { nil }
      content_file { nil }
    end

    factory :invalid_financial_entry, traits: [:invalid]
  end
end
