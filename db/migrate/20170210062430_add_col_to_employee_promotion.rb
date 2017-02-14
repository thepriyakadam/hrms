class AddColToEmployeePromotion < ActiveRecord::Migration
  def change
    add_column :employee_promotions, :current, :boolean
  end
end
