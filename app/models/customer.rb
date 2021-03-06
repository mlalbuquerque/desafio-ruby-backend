# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :credit_cards, dependent: :restrict_with_error
end
