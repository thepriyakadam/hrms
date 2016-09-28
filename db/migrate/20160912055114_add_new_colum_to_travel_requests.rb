class AddNewColumToTravelRequests < ActiveRecord::Migration
  def change
    add_column :travel_requests, :to, :date
    add_column :travel_requests, :day, :string
  end
end
