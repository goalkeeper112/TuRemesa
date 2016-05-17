class AddPhonesAndAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile_phone, :integer
    add_column :users, :home_phone, :integer
    add_column :users, :address, :string
    add_column :users, :id_image, :string
  end
end
