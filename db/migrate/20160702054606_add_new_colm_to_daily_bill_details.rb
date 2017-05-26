class AddNewColmToDailyBillDetails < ActiveRecord::Migration
  def change
    add_attachment :daily_bill_details, :passport_photo
    add_attachment :daily_bill_details, :avatar_file
  end
end
