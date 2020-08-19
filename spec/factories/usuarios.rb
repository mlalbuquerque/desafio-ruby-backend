FactoryBot.define do
  factory :usuario do |i|
    i.sequence(:uid) { |x| "uid_#{x}" }
    i.sequence(:email) { |x| "email_#{x}" }
    i.sequence(:nome) { |x| "nome_#{x}" }
    i.sequence(:primeiro_nome) { |x| "primeiro_nome:_#{x}" }
    i.sequence(:sobrenome) { |x| "sobrenome:_#{x}" }
    i.sequence(:foto) { |x| "foto_#{x}" }
    i.sequence(:token) { |x| "token_#{x}" }
  end
end
