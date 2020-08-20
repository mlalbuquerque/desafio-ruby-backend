class AddDataProcessadoToArquivos < ActiveRecord::Migration[6.0]
  def change
    add_column :arquivos, :data_processado, :datetime
  end
end
