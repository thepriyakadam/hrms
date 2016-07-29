class AddColToSlipInfo < ActiveRecord::Migration
  def change
    add_column :slip_informations, :cl_leave, :decimal
    add_column :slip_informations, :cl_balance, :decimal
    add_column :slip_informations, :el_leave, :decimal
    add_column :slip_informations, :el_balance, :decimal
    add_column :slip_informations, :coff_leave, :decimal
    add_column :slip_informations, :coff_balance, :decimal
    add_column :slip_informations, :advance_leave, :decimal
    add_column :slip_informations, :advance_balance, :decimal
    add_column :slip_informations, :lwp_leave, :decimal
    add_column :slip_informations, :esic_leave, :decimal
  end
end
