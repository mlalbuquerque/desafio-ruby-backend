class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.string :description
      t.string :nature
      t.string :signal

      t.timestamps
    end
  end
end
