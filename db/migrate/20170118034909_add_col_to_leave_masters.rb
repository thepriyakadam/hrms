class AddColToLeaveMasters < ActiveRecord::Migration
  def change
    add_column :leave_masters, :company_workingday, :decimal
  end
end
