class RemoveColFromDailyBillDetail < ActiveRecord::Migration
  def change
    remove_reference :daily_bill_details, :reporting_master, index: true, foreign_key: true
    add_reference :daily_bill_details, :reporting_master
  end
end
