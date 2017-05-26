class CreateEmployeeAttendances < ActiveRecord::Migration
  def change
    create_table :employee_attendances do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.string :present
      t.datetime :in_time
      t.datetime :out_time
      t.references :machine_attendance, index: true, foreign_key: true
      t.boolean :is_confirm, default: false
      t.references :department, index: true, foreign_key: true
      t.decimal :count, precision: 5, scale: 2
      t.references :employee_leav_request, index: true, foreign_key: true
      t.references :on_duty_request, index: true, foreign_key: true
      t.references :company_time_master, index: true, foreign_key: true
      t.string :working_hrs
      t.string :rest_time
      t.decimal :difference_hrs
      t.decimal :overtime_hrs
      t.decimal :late_mark
      t.string :month_name
      t.integer :employee_code
      t.string :employee_name

      t.timestamps null: false
    end
  end
end

    