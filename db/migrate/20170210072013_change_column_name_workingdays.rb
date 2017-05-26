class ChangeColumnNameWorkingdays < ActiveRecord::Migration
  def change
  	rename_column :workingdays, :ot_days, :ot_hours
  end
end
