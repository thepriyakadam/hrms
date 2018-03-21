class CreatePunchMasters < ActiveRecord::Migration
  def change
    create_table :punch_masters do |t|
      t.time :start_time
      t.time :end_time
      t.string :reader_in
      t.string :reader_out
      t.decimal :full_day_hrs
      t.decimal :half_day_hrs
      t.boolean :status

      t.timestamps null: false
    end
  end
end
