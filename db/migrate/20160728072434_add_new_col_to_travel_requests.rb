class AddNewColToTravelRequests < ActiveRecord::Migration
  def change
    add_column :travel_requests, :daily_bill_status, :text
  end
end
