class AddColmToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :od_leave, :decimal
  end
end
