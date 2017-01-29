class AddColToSlipInformation < ActiveRecord::Migration
  def change
    add_column :slip_informations, :cl_b, :decimal
    add_column :slip_informations, :el_b, :decimal
    add_column :slip_informations, :c_off_b, :decimal
    add_column :slip_informations, :advance_b, :decimal
  end
end
