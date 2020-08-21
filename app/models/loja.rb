class Loja < ApplicationRecord
  has_many :registros, dependent: :destroy

  def balance
    registros.map(&:value).sum
  end
end
