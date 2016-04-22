class AddReffToEmployeeGoals < ActiveRecord::Migration
  def change
    add_reference :employee_goals, :employee, index: true, foreign_key: true
  end
end
