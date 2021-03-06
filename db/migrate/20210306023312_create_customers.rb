class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :name
      t.string :ssn

      t.timestamps
    end
  end
end
