class AddRefToEmployeeAttribute < ActiveRecord::Migration
  def change
    add_column :employee_attributes, :performance_period
  end
end
