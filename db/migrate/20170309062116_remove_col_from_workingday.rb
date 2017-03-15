class RemoveColFromWorkingday < ActiveRecord::Migration
  def change
  	remove_column :workingdays, :cl_leave, :decimal
    remove_column :workingdays, :cl_balance, :decimal
    remove_column :workingdays, :el_leave, :decimal
    remove_column :workingdays, :el_balance, :decimal
    remove_column :workingdays, :coff_leave, :decimal
    remove_column :workingdays, :coff_balance, :decimal
    remove_column :workingdays, :advance_leave, :decimal
    remove_column :workingdays, :advance_balance, :decimal
    remove_column :workingdays, :lwp_leave, :decimal
    remove_column :workingdays, :esic_leave, :decimal
    remove_column :workingdays, :od_leave, :decimal

    add_column :workingdays, :od_day, :decimal
  end
end
