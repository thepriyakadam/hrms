class AddColToFoodDeductions < ActiveRecord::Migration
  def change
    add_column :food_deductions, :return_coupan, :integer
    add_column :food_deductions, :total_coupan, :integer
    change_column :food_deductions, :no_of_coupan, :integer
  end
end
