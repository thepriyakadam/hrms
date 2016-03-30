class RemoveColumnFromEmployeeGoals < ActiveRecord::Migration
  def change
    remove_column :employee_goals, :allign_to_supervisor, :boolean
  end
end
