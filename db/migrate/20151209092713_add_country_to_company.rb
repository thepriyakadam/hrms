class AddCountryToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :country, :string
  end
end
