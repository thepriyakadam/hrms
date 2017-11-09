class AddcolunmToWorkingday < ActiveRecord::Migration
  def change
    add_column :workingdays, :lwp_leave, :string
    add_column :workingdays, :cl_leave, :string
    add_column :workingdays, :el_leave, :string
    add_column :workingdays, :esic_leave, :string
    add_column :workingdays, :coff_leave, :string
  end
end
