class RefferenceInTravelRequests < ActiveRecord::Migration
  def change
  	remove_reference :travel_requests, :reporting_master, index: true, foreign_key: true
  	add_reference :travel_requests, :reporting_master
  end
end
