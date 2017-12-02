class RemoveLatAndLngFromEmployeePlans < ActiveRecord::Migration
  def change
    remove_column :employee_plans, :lat, :string
    remove_column :employee_plans, :lng, :string
  end
end
