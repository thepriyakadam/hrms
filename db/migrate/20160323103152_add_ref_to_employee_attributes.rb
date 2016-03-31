class AddRefToEmployeeAttributes < ActiveRecord::Migration
  def change
    add_reference :employee_attributes, :performance_period, index: true, foreign_key: true
  end
end
