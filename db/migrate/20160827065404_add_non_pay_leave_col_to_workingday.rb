class AddNonPayLeaveColToWorkingday < ActiveRecord::Migration
  def change
  	add_column :workingdays, :nonpay_leave, :decimal, precision: 10, scale: 2
  end
end
