class CreateArquivos < ActiveRecord::Migration[6.0]
  def change
    create_table :arquivos do |t|
      t.string :sha1

      t.timestamps
    end
  end
end
