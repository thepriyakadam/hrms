class ChangeTimeFormatInEmployeePlan < ActiveRecord::Migration
  # def change
  # end

    change_column :employee_plans, :from_time, :datetime
  	change_column :employee_plans, :to_time, :datetime
  
end
