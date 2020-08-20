class CreateRegistros < ActiveRecord::Migration[6.0]
  def change
    create_table :registros do |t|
      t.date :data
      t.decimal :valor, precision: 10, scale: 2
      t.time :hora
      t.integer :linha_no_arquivo
      t.references :tipo_de_transacao, null: false, foreign_key: true
      t.references :beneficiario, null: false, foreign_key: true
      t.references :cartao, null: false, foreign_key: true
      t.references :loja, null: false, foreign_key: true
      t.references :arquivo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
