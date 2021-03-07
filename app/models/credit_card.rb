# frozen_string_literal: true

class CreditCard < ApplicationRecord
  belongs_to :customer

  validates :number, presence: true
end
