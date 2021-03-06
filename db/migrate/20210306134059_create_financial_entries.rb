class CreateFinancialEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_entries, id: :uuid do |t|
      t.text :content_file

      t.timestamps
    end
  end
end
