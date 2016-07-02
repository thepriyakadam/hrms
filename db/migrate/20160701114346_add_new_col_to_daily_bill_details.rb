class AddNewColToDailyBillDetails < ActiveRecord::Migration
  def change
    add_column :daily_bill_details, :request_status, :string
  end
end
