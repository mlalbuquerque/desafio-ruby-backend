FactoryBot.define do
  factory :transaction do
    date { "2021-03-20" }
    value { "9.99" }
    cpf { "MyString" }
    card_number { "MyString" }
    hour { "MyString" }
    transaction_type { nil }
    store { nil }
  end
end
