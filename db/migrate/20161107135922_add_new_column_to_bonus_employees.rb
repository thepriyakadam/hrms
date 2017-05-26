class AddNewColumnToBonusEmployees < ActiveRecord::Migration
  def change
    add_column :bonus_employees, :actual_amount, :decimal
  end
end
