class CreateTransactionKinds < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_kinds, id: :uuid do |t|
      t.string :code, unique: true, unique: true
      t.string :description
      t.string :nature

      t.timestamps
    end

    add_index :transaction_kinds, :code, unique: true
  end
end
