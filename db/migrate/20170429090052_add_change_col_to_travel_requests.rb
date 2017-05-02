class AddChangeColToTravelRequests < ActiveRecord::Migration
  def change
  	remove_reference :travel_request_histories, :reporting_master, index: true, foreign_key: true
  	add_reference :travel_request_histories ,:reporting_master
  	remove_reference :reporting_masters_travel_requests, :reporting_master, index: true, foreign_key: true
  	add_reference :reporting_masters_travel_requests ,:reporting_master
  	remove_reference :travel_requests, :reporting_master, index: true, foreign_key: true
  	add_reference :travel_requests ,:reporting_master
  end
end
