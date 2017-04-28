class CreateLeaveRecords < ActiveRecord::Migration
  def change
    create_table :leave_records do |t|
      t.references :employee_leav_request, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.string :status

      t.timestamps null: false
    end
  end
end
