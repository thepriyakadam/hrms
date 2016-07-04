class AddNewColmToDailyBillDetails < ActiveRecord::Migration
  def change
    add_column :daily_bill_details, :remark, :text
    add_attachment :daily_bill_details, :passport_photo
    add_attachment :daily_bill_details, :avatar_file
    add_column :daily_bill_details, :remarks, :text
    add_reference :daily_bill_details, :currency_master, index: true, foreign_key: true
  end
end
