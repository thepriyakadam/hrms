class AddRefToEmployeeGoals < ActiveRecord::Migration
  def change
    add_reference :employee_goals, :appraiser, index: true, foreign_key: true
    add_reference :employee_goals, :appraiser2, index: true, foreign_key: true
  end
end
