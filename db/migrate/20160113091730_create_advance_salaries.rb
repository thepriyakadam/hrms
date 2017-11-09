class CreateAdvanceSalaries < ActiveRecord::Migration
  def change
    create_table :advance_salaries do |t|
      t.references :employee, index: true, foreign_key: true
      t.decimal :advance_amount, precision: 15, scale: 2
      t.string :no_of_instalment
      t.decimal :instalment_amount, precision: 15, scale: 2
      t.date :advance_date

      t.timestamps null: false
    end
  end
end
