class AddCountryToRemittance < ActiveRecord::Migration
  def change
    add_reference :remittances, :country, index: true, foreign_key: true
  end
end
