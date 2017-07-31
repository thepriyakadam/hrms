class AddColToWorkingdays < ActiveRecord::Migration
  def change
  	remove_column :workingdays, :lwp_leave
  	remove_column :workingdays, :cl_leave
  	remove_column :workingdays, :el_leave
  	remove_column :workingdays, :esic_leave
  	remove_column :workingdays, :coff_leave
  end
end
