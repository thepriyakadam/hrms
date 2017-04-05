class AddColToEmployeeTemplates < ActiveRecord::Migration
  def change
    add_column :employee_templates, :gross_salary, :decimal
  end
end
