# frozen_string_literal: true

class TransactionKindNature < ApplicationEnumeration
  associate_values :credit, :debit
end
