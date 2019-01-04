class CreateDailyAttendances < ActiveRecord::Migration
  def change
    create_table :daily_attendances do |t|
      t.string :sr_no
      t.date :date
      t.time :time
      t.string :employee_code
      t.string :card_no
      t.string :employee_name
      t.string :controller
      t.string :reader_name
      t.string :access_status
      t.float  :latitude
      t.float  :longitude
      t.string :place

      t.timestamps null: false
    end
  end
end
