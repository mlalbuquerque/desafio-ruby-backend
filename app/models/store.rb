# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, presence: true
end
