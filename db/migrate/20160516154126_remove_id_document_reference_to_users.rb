class RemoveIdDocumentReferenceToUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :id_document, index: true, foreign_key: true
  end
end
