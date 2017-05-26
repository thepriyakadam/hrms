class AddNewColumToDailyBillDetails < ActiveRecord::Migration
  def change
    add_column :daily_bill_details, :is_sent, :boolean
  end
end
