class AddIdDocumentStringToUser < ActiveRecord::Migration
  def change
    add_column :users, :id_document, :string
  end
end
