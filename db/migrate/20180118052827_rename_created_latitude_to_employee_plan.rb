class RenameCreatedLatitudeToEmployeePlan < ActiveRecord::Migration
  def change
  	rename_column :employee_plans, :present_longitude, :created_longitude
  	rename_column :employee_plans, :present_latitude, :created_latitude
  	rename_column :employee_plans, :present_place, :created_place
  end
end
