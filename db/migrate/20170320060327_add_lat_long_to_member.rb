class AddLatLongToMember < ActiveRecord::Migration
  def change
    add_column :members, :is_gps, :boolean
    add_column :members, :latitude, :float
    add_column :members, :longitude, :float
  end
end
