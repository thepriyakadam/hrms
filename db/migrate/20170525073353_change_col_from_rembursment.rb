class ChangeColFromRembursment < ActiveRecord::Migration
  def change
  	change_column :rembursments, :status, :string
  	change_column :reporting_master_rembursments, :status, :string
  end
end
