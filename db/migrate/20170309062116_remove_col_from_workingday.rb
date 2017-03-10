class RemoveColFromWorkingday < ActiveRecord::Migration
  def change
    add_column :workingdays, :od_day, :decimal
  end
end
