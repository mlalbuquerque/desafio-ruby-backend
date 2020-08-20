class AddIdexToColumnSha1FromArquivo < ActiveRecord::Migration[6.0]
  def change
    add_index :arquivos, :sha1, unique: true
  end
end
