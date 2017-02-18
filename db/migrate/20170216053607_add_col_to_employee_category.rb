class AddColToEmployeeCategory < ActiveRecord::Migration
  def change
    add_column :employee_categories, :is_active, :boolean
  end
end
