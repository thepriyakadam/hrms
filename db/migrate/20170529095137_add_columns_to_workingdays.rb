class AddColumnsToWorkingdays < ActiveRecord::Migration
  def change
  	add_column :workingdays , :nonpayable_day , :decimal
  	add_column :workingdays , :gatepass , :decimal
  end
end
