class AddColToEmployeeGoal < ActiveRecord::Migration
  def change
    add_column :employee_goals, :is_confirm, :boolean
  end
end
