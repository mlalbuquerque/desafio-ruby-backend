class AddLinhasToArquivos < ActiveRecord::Migration[6.0]
  def change
    add_column :arquivos, :linhas, :integer
  end
end
