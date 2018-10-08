class CreateResignationStatusRecords < ActiveRecord::Migration
  def change
    create_table :resignation_status_records do |t|
      t.references :employee_resignation, index: true, foreign_key: true
      t.references :change_status_employee
      t.string :status
      t.datetime :change_date

      t.timestamps null: false
    end
  end
end
