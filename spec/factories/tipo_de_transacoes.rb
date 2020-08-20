FactoryBot.define do
  factory :tipo_de_transacao do
    tipo { 1 }
    descricao { 'MyString' }
    natureza { 'MyString' }
    sinal { false }
  end
end
