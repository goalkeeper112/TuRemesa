class AddStatusToRemittance < ActiveRecord::Migration
  def change
    add_column :remittances, :status, :string
  end
end
