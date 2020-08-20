class TipoDeTransacao < ApplicationRecord
  def factor
    sinal ? 1 : -1
  end
end
