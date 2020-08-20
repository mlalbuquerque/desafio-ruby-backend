FactoryBot.define do
  factory :registro do
    data { '2020-08-20' }
    valor { '9.99' }
    hora { '2020-08-20 03:49:19' }
    linha_no_arquivo { 1 }
    tipo_de_transacao { nil }
    beneficiario { nil }
    cartao { nil }
    loja { nil }
    arquivo { nil }
  end
end
