# frozen_string_literal: true

class FinancialEntry < ApplicationRecord
  belongs_to :user

  validates :content_file, presence: true
end
