class AddNewColToEmployeePromotion < ActiveRecord::Migration
  def change
    add_column :employee_promotions, :designation, :string
    add_column :employee_promotions, :grade, :string
    add_column :employee_promotions, :category, :string
    add_column :employee_promotions, :employee_department, :string
  end
end
