class AddRefToEmployeeGoals < ActiveRecord::Migration
  def change
    add_reference :employee_goals, :period, index: true, foreign_key: true
  end
end
