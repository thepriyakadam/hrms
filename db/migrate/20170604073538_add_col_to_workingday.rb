class AddColToWorkingday < ActiveRecord::Migration
  def change
    add_column :workingdays, :nonpayable_day, :decimal
  end
end
