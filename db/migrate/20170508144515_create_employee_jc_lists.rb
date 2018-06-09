class CreateEmployeeJcLists < ActiveRecord::Migration
  def change
    create_table :employee_jc_lists do |t|
      t.references :joining_checklist_master, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :admin
      t.boolean :status , default: false 

      t.timestamps null: false
    end
  end
end
