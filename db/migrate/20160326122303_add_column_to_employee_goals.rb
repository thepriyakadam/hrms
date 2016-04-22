class AddColumnToEmployeeGoals < ActiveRecord::Migration
  def change
    add_column :employee_goals, :allign_to_supervisor, :string
  end
end
