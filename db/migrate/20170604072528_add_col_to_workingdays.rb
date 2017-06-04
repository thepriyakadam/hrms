class AddColToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :gatepass, :decimal
  end
end
