class RemoveColFromTravelRequestHistory < ActiveRecord::Migration
  def change
    remove_reference :travel_request_histories, :reporting_master, index: true, foreign_key: true
    add_reference :travel_request_histories, :reporting_master
  end
end
