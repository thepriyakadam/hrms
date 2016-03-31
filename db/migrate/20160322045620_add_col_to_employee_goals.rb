class AddColToEmployeeGoals < ActiveRecord::Migration
  def change
    add_column :employee_goals, :allign_to_supervisor, :boolean
  end
end
