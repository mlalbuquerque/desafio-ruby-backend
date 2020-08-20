class CreateTipoDeTransacoes < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_de_transacoes do |t|
      t.integer :tipo
      t.string :descricao
      t.string :natureza
      t.boolean :sinal

      t.timestamps
    end
  end
end
