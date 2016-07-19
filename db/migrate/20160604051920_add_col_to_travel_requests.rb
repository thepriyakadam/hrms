class AddColToTravelRequests < ActiveRecord::Migration
  def change
    add_column :travel_requests, :is_confirm, :boolean
  end
end
