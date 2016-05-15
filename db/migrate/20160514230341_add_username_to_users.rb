class AddUsernameToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
