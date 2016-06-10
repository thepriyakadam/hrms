class AddRefToDailyBillDetails < ActiveRecord::Migration
  def change
    add_reference :daily_bill_details, :travel_expence_type, index: true, foreign_key: true
  end
end
