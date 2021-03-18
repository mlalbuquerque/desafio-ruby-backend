class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards, id: :uuid do |t|
      t.belongs_to :customer, null: false, foreign_key: true, type: :uuid
      t.string :number

      t.timestamps
    end
  end
end
