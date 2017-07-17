class ChangeColInWorkingdays < ActiveRecord::Migration
  def change
  	change_column :workingdays, :payable_day, :decimal, precision: 5, scale: 2
  end
end
