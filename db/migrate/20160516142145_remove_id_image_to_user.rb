class RemoveIdImageToUser < ActiveRecord::Migration
  def change
    remove_column :users, :id_image, :string
  end
end
