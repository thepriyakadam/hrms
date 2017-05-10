class AddNewColumnToTravelRequests < ActiveRecord::Migration
  def change
    add_column :travel_requests, :expense, :decimal
  end
end
