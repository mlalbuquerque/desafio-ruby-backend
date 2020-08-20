class CreateBeneficiarios < ActiveRecord::Migration[6.0]
  def change
    create_table :beneficiarios do |t|
      t.string :cpf

      t.timestamps
    end
  end
end
