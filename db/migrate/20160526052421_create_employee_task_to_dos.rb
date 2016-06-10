class CreateEmployeeTaskToDos < ActiveRecord::Migration
  def change
    create_table :employee_task_to_dos do |t|
      t.references :employee, index: true, foreign_key: true
      t.text :task_name
      t.date :task_date
      t.boolean :status
      t.time :task_time

      t.timestamps null: false
    end
  end
end
