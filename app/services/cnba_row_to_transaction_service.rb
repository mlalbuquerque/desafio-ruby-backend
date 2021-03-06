# frozen_string_literal: true

class CNBARowToTransactionService < ApplicationService
  def initialize(row)
    @row = row
  end

  def perform
    @transaction = Transaction.create(transaction_params)

    self
  end

  def success?
    transaction.persisted?
  end

  private

  def transaction_params
    { occurred_at: serialized_transaction[:occurred_at],
      amount: serialized_transaction[:amount], credit_card_id: credit_card.id,
      kind_id: kind.id, store_id: store.id }
  end

  def kind
    @kind ||= TransactionKind.find_by(code: serialized_transaction[:kind_code])
  end

  def store
    @store ||= Store.find_or_create_by(store_search_params) do |s|
      s.responsible_name = serialized_transaction[:store_responsible_name]
    end
  end

  def store_search_params
    { name: serialized_transaction[:store_name] }
  end

  def credit_card
    @credit_card ||= CreditCard.find_or_create_by(cc_search_params) do |cc|
      cc.customer_id = customer.id
    end
  end

  def cc_search_params
    { number: serialized_transaction[:credit_card_number] }
  end

  def customer
    @customer ||=
      Customer.find_or_create_by(ssn: serialized_transaction[:customer_ssn])
  end

  def serialized_transaction
    @serialized_transaction ||= CNBARowToTransactionSerializer.new(row).as_json
  end

  attr_reader :row, :transaction
end
