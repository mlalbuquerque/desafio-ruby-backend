# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { Faker::Company.bs }
    ssn { Faker::CPF.numeric }
  end
end
