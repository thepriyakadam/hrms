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

      t.timestamps null: false
    end
  end
end
