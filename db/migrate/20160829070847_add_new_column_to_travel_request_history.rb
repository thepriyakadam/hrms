class AddNewColumnToTravelRequestHistory < ActiveRecord::Migration
  def change
    add_column :travel_request_histories, :daily_bill_status, :string
  end
end
