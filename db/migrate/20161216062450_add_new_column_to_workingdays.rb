class AddNewColumnToWorkingdays < ActiveRecord::Migration
  def change
  	add_column :workingdays, :calculated_payable_days, :decimal
  end
end
