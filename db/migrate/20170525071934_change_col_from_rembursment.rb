class ChangeColFromRembursment < ActiveRecord::Migration
  def change
  	remove_column :rembursments, :status, :boolean
  	add_column :rembursments, :status, :string

  	remove_column :reporting_master_rembursments, :status, :boolean
  	add_column :reporting_master_rembursments, :status, :string
  end
end
