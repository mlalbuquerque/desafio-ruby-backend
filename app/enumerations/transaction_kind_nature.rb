# frozen_string_literal: true

class TransactionKindNature < EnumerateIt::Base
  associate_values :credit, :debit
end
