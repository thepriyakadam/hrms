class AddLagutudeAndLatitudeToEmployeePlan < ActiveRecord::Migration
  def change
    add_column :employee_plans, :latitude, :float
    add_column :employee_plans, :longitude, :float
  end
end
