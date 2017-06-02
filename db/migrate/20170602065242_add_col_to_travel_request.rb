class AddColToTravelRequest < ActiveRecord::Migration
  def change
    add_column :travel_requests, :total_advance, :decimal
  end
end
