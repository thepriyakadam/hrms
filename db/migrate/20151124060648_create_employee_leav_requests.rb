class CreateEmployeeLeavRequests < ActiveRecord::Migration
  def change
    create_table :employee_leav_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.string :leave_type
      t.datetime :start_date
      t.datetime :end_date
      t.string :date_range
      t.integer :no_of_day
      t.decimal :leave_count, precision: 5, scale: 1
      t.boolean :first_half
      t.boolean :last_half
      t.string :reason
      t.boolean :is_pending
      t.boolean :is_cancelled
      t.boolean :is_first_approved
      t.boolean :is_second_approved
      t.boolean :is_first_rejected
      t.boolean :is_second_rejected
      t.integer :current_status
      t.string :current_status1
      t.references :first_reporter, index: true, foreign_key: true
      t.references :second_reporter, index: true, foreign_key: true
      t.boolean :present_status

      t.timestamps null: false
    end
  end
end
