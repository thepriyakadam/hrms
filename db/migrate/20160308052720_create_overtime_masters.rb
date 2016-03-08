class CreateOvertimeMasters < ActiveRecord::Migration
  def change
    create_table :overtime_masters do |t|
      t.boolean :is_over_time
      t.integer :day
      t.decimal :company_hrs, precision: 15, scale: 2, default: 0
      t.decimal :ot_rate, precision: 15, scale: 2, default: 0
      t.boolean :is_esic
      t.boolean :status

      t.timestamps null: false
    end
  end
end
