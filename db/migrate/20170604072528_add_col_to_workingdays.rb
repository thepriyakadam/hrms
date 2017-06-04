class AddColToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :gatepass, :decimal
    add_column :workingdays, :nonpayble_day, :decimal
  end
end
