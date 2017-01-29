class AddColToFoodDeductions1 < ActiveRecord::Migration
  def change
    add_column :food_deductions, :is_paid, :boolean
  end
end
