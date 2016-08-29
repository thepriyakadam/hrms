class AddNewColToTravelRequestHistory < ActiveRecord::Migration
  def change
    add_column :travel_request_histories, :status, :string
  end
end
