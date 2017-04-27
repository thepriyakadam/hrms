class ChangeColToWellFaires < ActiveRecord::Migration
  def change
  	change_column :well_faires,:status, :boolean
  end
end
