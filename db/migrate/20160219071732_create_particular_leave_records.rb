class CreateParticularLeaveRecords < ActiveRecord::Migration
  def change
    create_table :particular_leave_records do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :employee_leav_request, index: true, foreign_key: true
      t.references :leav_category, index: true, foreign_key: true
      t.datetime :leave_date
      t.boolean :is_full

      t.timestamps null: false
    end
  end
end
