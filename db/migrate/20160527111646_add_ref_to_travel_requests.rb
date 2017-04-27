class AddRefToTravelRequests < ActiveRecord::Migration
  def change
    add_reference :travel_requests, :travel_mode, index: true, foreign_key: true
  end
end
