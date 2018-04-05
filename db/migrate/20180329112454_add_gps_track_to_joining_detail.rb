class AddGpsTrackToJoiningDetail < ActiveRecord::Migration
  def change
    add_column :joining_details, :gps_track, :boolean
    add_column :joining_details, :restricted_area, :boolean
  end
end
