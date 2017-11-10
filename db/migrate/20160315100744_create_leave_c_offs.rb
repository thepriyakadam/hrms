class CreateLeaveCOffs < ActiveRecord::Migration
  def change
    create_table :leave_c_offs do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :c_off_date
      t.string :c_off_type
      t.integer :c_off_expire_day, default: 60
      t.boolean :expiry_status
      t.boolean :is_taken, default: false
      t.date :expiry_date
      t.decimal :leave_count, precision: 3, scale: 1
      t.boolean :is_expire
      t.boolean :status
      t.integer :c_off_expire_day, default: false
      t.string :current_status
      t.date :taken_date

      t.timestamps null: false
    end
  end
end
