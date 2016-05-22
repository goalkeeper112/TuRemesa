class AddLimitAccountToRemittance < ActiveRecord::Migration
  def change
    add_column :remittances, :number_account, :integer, :precision=>64, :scale=>12, :limit=>20
  end
end
