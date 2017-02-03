class RemoveColFromSlipInformation < ActiveRecord::Migration
  def change
    remove_column :slip_informations, :cl_leave, :string
    remove_column :slip_informations, :cl_balance, :string
    remove_column :slip_informations, :el_leave, :string
    remove_column :slip_informations, :el_balance, :string
    remove_column :slip_informations, :coff_leave, :string
    remove_column :slip_informations, :coff_balance, :string
    remove_column :slip_informations, :advance_leave, :string
    remove_column :slip_informations, :advance_balance, :string
    remove_column :slip_informations, :lwp_leave, :string
    remove_column :slip_informations, :esic_leave, :string
  end
end
