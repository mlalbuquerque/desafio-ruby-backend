class Loja < ApplicationRecord
  has_many :registros, dependent: :destroy
end
