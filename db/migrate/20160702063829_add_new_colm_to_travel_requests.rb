class AddNewColmToTravelRequests < ActiveRecord::Migration
  def change
    add_column :travel_requests, :comment, :text
  end
end
