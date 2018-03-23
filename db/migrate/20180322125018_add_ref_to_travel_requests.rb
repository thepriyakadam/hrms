class AddRefToTravelRequests < ActiveRecord::Migration
  def change
     add_reference :travel_requests, :reporting_master 
  end
end
