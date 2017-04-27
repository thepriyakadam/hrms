class CreateFoodDeductions < ActiveRecord::Migration
  def change
    create_table :food_deductions do |t|
      t.date :food_date
      t.integer :no_of_coupan
      t.references :food_coupan_master, index: true, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2, default: 0
      t.references :employee, index: true, foreign_key: true
      t.integer :return_coupan
      t.integer :total_coupan

      t.timestamps null: false
    end
  end
end
