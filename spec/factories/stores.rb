# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { Faker::Company.bs }
    responsible_name { Faker::Name.unique.name }
  end
end
