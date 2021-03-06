# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :credit_card
  belongs_to :store
  belongs_to :kind, class_name: 'TransactionKind'
  has_one :customer, through: :credit_card
end
