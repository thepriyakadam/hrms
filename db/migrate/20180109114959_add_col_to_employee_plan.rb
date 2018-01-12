class AddColToEmployeePlan < ActiveRecord::Migration
  def change
remove_column :employee_plans, :conform, :boolean
 add_column :employee_plans, :confirm, :boolean   
  end
end
