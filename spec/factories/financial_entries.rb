# frozen_string_literal: true

FactoryBot.define do
  factory :financial_entry do
    user
    content_file { File.open('./CNAB.txt').read }
  end
end
