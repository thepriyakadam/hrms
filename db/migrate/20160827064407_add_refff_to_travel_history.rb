class AddRefffToTravelHistory < ActiveRecord::Migration
  def change
    add_reference :travel_request_histories, :travel_mode, index: true, foreign_key: true
    add_reference :travel_request_histories, :employee, index: true, foreign_key: true
  end
end
