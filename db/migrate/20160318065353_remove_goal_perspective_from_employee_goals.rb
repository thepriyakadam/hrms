class RemoveGoalPerspectiveFromEmployeeGoals < ActiveRecord::Migration
  def change
    remove_column :employee_goals, :allign_to_supervisor, :boolean
    remove_column :employee_goals, :appraisee_comment, :text
    remove_column :employee_goals, :appraisee_rating, :integer
    remove_column :employee_goals, :appraiser_comment, :text
    remove_column :employee_goals, :appraiser_rating, :integer
  end
end
