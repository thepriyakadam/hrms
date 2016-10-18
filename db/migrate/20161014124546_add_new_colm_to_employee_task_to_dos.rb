class AddNewColmToEmployeeTaskToDos < ActiveRecord::Migration
  def change
    add_column :employee_task_to_dos, :task_time1, :datetime
  end
end
