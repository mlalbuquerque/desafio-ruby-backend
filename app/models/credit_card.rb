# frozen_string_literal: true

class CreditCard < ApplicationRecord
  belongs_to :customer
end
