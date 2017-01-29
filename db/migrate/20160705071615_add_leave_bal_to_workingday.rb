class AddLeaveBalToWorkingday < ActiveRecord::Migration
  def change
    remove_column :workingdays, :month, :integer

    remove_column :slip_informations, :cl_b, :decimal
    remove_column :slip_informations, :el_b, :decimal
    remove_column :slip_informations, :c_off_b, :decimal
    remove_column :slip_informations, :advance_b, :decimal
    remove_column :slip_informations, :cl, :decimal
    remove_column :slip_informations, :el, :decimal
    remove_column :slip_informations, :c_off, :decimal
    remove_column :slip_informations, :advance, :decimal
   	remove_column :workingdays, :lwp_leave, :string
    remove_column :workingdays, :cl_leave, :string
    remove_column :workingdays, :el_leave, :string
    remove_column :workingdays, :esic_leave, :string
    remove_column :workingdays, :coff_leave, :string

    add_column :workingdays, :lwp_leave, :decimal
    add_column :workingdays, :cl_leave, :decimal
    add_column :workingdays, :el_leave, :decimal
    add_column :workingdays, :esic_leave, :decimal
    add_column :workingdays, :coff_leave, :decimal

    add_column :workingdays, :advance_leave, :decimal
    add_column :workingdays, :cl_balance, :decimal
    add_column :workingdays, :el_balance, :decimal
    add_column :workingdays, :coff_balance, :decimal
    add_column :workingdays, :advance_balance, :decimal
  end
end