class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.belongs_to :credit_card, null: false, foreign_key: true, type: :uuid
      t.belongs_to :store, null: false, foreign_key: true, type: :uuid
      t.belongs_to :kind, null: false,
                          foreign_key: { to_table: :transaction_kinds },
                          type: :uuid
      t.datetime :occurred_at
      t.decimal :amount

      t.timestamps
    end
  end
end
