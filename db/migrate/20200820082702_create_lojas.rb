class CreateLojas < ActiveRecord::Migration[6.0]
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :representante

      t.timestamps
    end
  end
end
