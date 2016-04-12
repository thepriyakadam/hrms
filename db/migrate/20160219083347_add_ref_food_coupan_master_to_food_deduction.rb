class AddRefFoodCoupanMasterToFoodDeduction < ActiveRecord::Migration
  def change
    add_reference :food_deductions, :food_coupan_master, index: true, foreign_key: true

    remove_column :food_deductions, :rate
  end
end
