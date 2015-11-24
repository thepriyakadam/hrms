class CreateEmployeeLeavRequests < ActiveRecord::Migration
  def change
    create_table :employee_leav_requests do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.string :leave_type
      t.datetime :satrt_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
