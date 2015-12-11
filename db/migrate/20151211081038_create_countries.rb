class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name

      t.timestamps null: false
    end
  end

  add_reference :companies, :country, index: true, foreign_key: true
  add_reference :company_locations, :country, index: true, foreign_key: true
  add_reference :employees, :country, index: true, foreign_key: true
  add_reference :families, :country, index: true, foreign_key: true

end
