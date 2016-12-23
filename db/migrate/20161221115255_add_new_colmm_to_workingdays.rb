class AddNewColmmToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :ot_days, :decimal
  end
end
