class AddNewColumnToDailyBillDetails < ActiveRecord::Migration
  def change
    add_column :daily_bill_details, :comment, :text
  end
end
