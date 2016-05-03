class AddColToEmployeeAttributes < ActiveRecord::Migration
  def change
    add_column :employee_attributes, :is_confirm, :boolean
  end
end
