class ChangeDatatypeToLocationHistroy < ActiveRecord::Migration
  def change
  	change_column :employee_location_histories, :location, :text
  end
end
