class RemoveColFromDailyBillDetails < ActiveRecord::Migration
  def change
    remove_attachment :daily_bill_details, :passport_photo
    remove_attachment :daily_bill_details, :avatar_file
    
    add_attachment :daily_bill_details, :passport_photo
    add_attachment :daily_bill_details, :avatar_file
  end
end
