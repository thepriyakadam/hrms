class AddClmToEmployeeGoals < ActiveRecord::Migration
  def change
    add_column :employee_goals, :emp_head, :string
    add_column :employee_attributes, :emp_head, :string

    remove_column :employee_goals, :appraisee_id, :integer
    remove_column :employee_goals, :appraiser_id, :integer
    remove_column :employee_goals, :goal_measure_id, :integer

    remove_column :employee_attributes, :appraisee_id, :integer
    remove_column :employee_attributes, :appraiser_id, :integer
    remove_column :employee_attributes, :definition_id, :integer
  end
end
