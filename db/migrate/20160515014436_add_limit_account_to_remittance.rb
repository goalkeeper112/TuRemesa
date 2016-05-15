class AddLimitAccountToRemittance < ActiveRecord::Migration
  def change
    remove_column :remittances, :number_account
    add_column :remittances, :number_account, :integer, :precision=>64, :scale=>12, :limit=>20
  end
end
