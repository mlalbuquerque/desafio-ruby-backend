class AddUserToFinancialEntries < ActiveRecord::Migration[6.1]
  def change
    add_reference :financial_entries, :user, null: false,
                                             foreign_key: true,
                                             type: :uuid
  end
end
