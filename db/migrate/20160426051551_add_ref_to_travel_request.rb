class AddRefToTravelRequest < ActiveRecord::Migration
  def change
    add_reference :travel_requests, :reporting_master, index: true, foreign_key: true
  end
end
