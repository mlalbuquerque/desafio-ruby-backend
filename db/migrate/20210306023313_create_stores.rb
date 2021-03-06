class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores, id: :uuid do |t|
      t.string :name
      t.string :responsible_name

      t.timestamps
    end
  end
end
