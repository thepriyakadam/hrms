class AddCurrentStatusToTravelRequests < ActiveRecord::Migration
  def change
  	add_column :travel_requests, :current_status, :string
    add_column :reporting_masters_travel_requests, :travel_status, :string
  end
end
