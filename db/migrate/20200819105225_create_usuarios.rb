class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :uid
      t.string :email
      t.string :nome
      t.string :primeiro_nome
      t.string :sobrenome
      t.string :foto
      t.string :token

      t.timestamps
    end
  end
end
