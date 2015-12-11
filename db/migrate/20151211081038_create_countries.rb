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

  # remove_column :companies, :ceo_name
  # remove_column :companies, :country
  # remove_column :companies, :state
  # remove_column :companies, :district

  # remove_column :company_locations, :country
  # remove_column :company_locations, :state
  # remove_column :company_locations, :district

  # remove_column :employee, :country
  # remove_column :employee, :state
  # remove_column :employee, :district

  # remove_column :families, :country
  # remove_column :families, :state
  # remove_column :families, :dist
end
