class CreateCartoes < ActiveRecord::Migration[6.0]
  def change
    create_table :cartoes do |t|
      t.string :numero

      t.timestamps
    end
  end
end
