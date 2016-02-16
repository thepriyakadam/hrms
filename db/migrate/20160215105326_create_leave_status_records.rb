class CreateLeaveStatusRecords < ActiveRecord::Migration
  def change
    create_table :leave_status_records do |t|
      t.references :employee_leav_request, index: true, foreign_key: true
      t.references :change_status_employee, index: true, foreign_key: true
      t.string :status
      t.datetime :change_date

      t.timestamps null: false
    end
  end
end
