# frozen_string_literal: true

class TransactionKind < ApplicationRecord
  has_enumeration_for :nature, with: TransactionKindNature, create_helpers: true
end
