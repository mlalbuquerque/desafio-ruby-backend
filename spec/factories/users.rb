# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.uuid }

    trait :invalid do
      name { nil }
      email { nil }
      password { nil }
    end

    trait :know_password do
      password { 'asdf1234' }
    end

    trait :manager do
      manager { true }
    end

    factory :invalid_user, traits: [:invalid]
    factory :manager_user, traits: [:manager]
    factory :session_user, traits: [:know_password]
  end
end
