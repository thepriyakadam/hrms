class AddRefenceToAdvanceSalary < ActiveRecord::Migration
  def change
    add_reference :advance_salaries, :advance_type, index: true, foreign_key: true
    add_column :advance_salaries, :interest, :decimal, precision: 15, scale: 2
  end
end
