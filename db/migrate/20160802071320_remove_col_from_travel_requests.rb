class RemoveColFromTravelRequests < ActiveRecord::Migration
  def change
    remove_column :travel_requests, :traveling_advance
    remove_column :travel_requests, :lodging_boarding_advance
    remove_column :travel_requests, :extra_advance

    remove_column :travel_request_histories, :traveling_advance
    remove_column :travel_request_histories, :lodging_boarding_advance
    remove_column :travel_request_histories, :extra_advance
    remove_column :travel_request_histories, :food_advance

    remove_column :daily_bill_details, :local_travel_expence
    remove_column :daily_bill_details, :lodging_expence
    remove_column :daily_bill_details, :boarding_expence
    remove_column :daily_bill_details, :other_expence
  end
end