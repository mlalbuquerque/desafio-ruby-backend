class PopulateTransactionKinds < ActiveRecord::Migration[6.1]
  TRANSACTION_KIND_PARAMS = [
    { code: 1, description: 'Débito', nature: :credit },
    { code: 2, description: 'Boleto', nature: :debit },
    { code: 3, description: 'Financiamento', nature: :debit },
    { code: 4, description: 'Crédito', nature: :credit },
    { code: 5, description: 'Recebimento Empréstimo', nature: :credit },
    { code: 6, description: 'Vendas', nature: :credit },
    { code: 7, description: 'Recebimento TED', nature: :credit },
    { code: 8, description: 'Recebimento DOC', nature: :credit },
    { code: 9, description: 'Aluguel', nature: :debit },
  ].freeze

  def change
    ActiveRecord::Base.transaction do
      TRANSACTION_KIND_PARAMS.map do |transaction_kind_params|
        TransactionKind.create!(transaction_kind_params)
      end
    end
  end
end
