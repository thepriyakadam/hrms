class AddColToDailyBillDetails < ActiveRecord::Migration
  def change
    add_column :daily_bill_details, :is_confirm, :boolean
  end
end
