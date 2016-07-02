class AddReferencesToDailyBillDetails < ActiveRecord::Migration
  def change
    add_reference :daily_bill_details, :reporting_master, index: true, foreign_key: true
  end
end
