class AddColumnsToRemittances < ActiveRecord::Migration
  def change
    add_column :remittances, :method_pay, :string
    add_column :remittances, :date_withdrawal, :datetime
    add_column :remittances, :optional_address, :string
    add_column :remittances, :optional_info, :string
  end
end
