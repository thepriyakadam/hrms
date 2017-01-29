class CreateFoodDeductions < ActiveRecord::Migration
  def change
    create_table :food_deductions do |t|
      t.date :food_date
      t.string :no_of_coupan
      t.decimal :rate, precision: 15, scale: 2, default: 0
      t.decimal :amount, precision: 15, scale: 2, default: 0
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
