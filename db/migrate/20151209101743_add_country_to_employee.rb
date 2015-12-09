class AddCountryToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :country, :string
    add_column :families, :country, :string
  end
end
