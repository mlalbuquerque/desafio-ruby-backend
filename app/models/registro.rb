class Registro < ApplicationRecord
  belongs_to :tipo_de_transacao
  belongs_to :beneficiario
  belongs_to :cartao
  belongs_to :loja
  belongs_to :arquivo
end
