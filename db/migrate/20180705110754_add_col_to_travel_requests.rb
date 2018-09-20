class AddColToTravelRequests < ActiveRecord::Migration
  def change
    add_reference :travel_requests, :project_master, index: true, foreign_key: true
    add_column :travel_requests, :approved_amount, :decimal, :precision => 15, :scale => 10
    add_column :travel_requests, :from_time, :time
    add_column :travel_requests, :to_time, :time
  end
end
