class CreateRemittances < ActiveRecord::Migration
  def change
    create_table :remittances do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :from
      t.string :to
      t.decimal :amount_send
      t.decimal :amount_receive
      t.string :bank
      t.string :type_account
      t.integer :number_account
      t.string :id_card

      t.timestamps null: false
    end
  end
end
