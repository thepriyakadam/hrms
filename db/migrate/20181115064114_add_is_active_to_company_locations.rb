class AddIsActiveToCompanyLocations < ActiveRecord::Migration
  def change
    add_column :company_locations, :is_active, :boolean
  end
end
