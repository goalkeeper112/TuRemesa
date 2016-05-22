class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, unique: true
      t.string :abbreviation, unique: true
      t.string :country_code, unique: true
      t.string :phone_code, unique: true

      t.timestamps null: false
    end
  end
end
