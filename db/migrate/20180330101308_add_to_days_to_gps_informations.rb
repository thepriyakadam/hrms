class AddToDaysToGpsInformations < ActiveRecord::Migration
  def change
    add_column :gps_informations, :to_days, :date
  end
end
