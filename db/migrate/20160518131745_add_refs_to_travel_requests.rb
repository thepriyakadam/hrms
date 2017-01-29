class AddRefsToTravelRequests < ActiveRecord::Migration
  def change
    add_reference :travel_requests, :travel_option, index: true, foreign_key: true
  end
end
