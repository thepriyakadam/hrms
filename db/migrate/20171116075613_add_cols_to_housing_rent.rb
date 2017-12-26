class AddColsToHousingRent < ActiveRecord::Migration
  def change
    add_column :housing_rents, :month, :string
    add_column :housing_rents, :year, :string
  end
end
