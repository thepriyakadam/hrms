class AddStateCountryToCompanyLocation < ActiveRecord::Migration
  def change
    add_column :company_locations, :state, :string
    add_column :company_locations, :country, :string
  end
end
