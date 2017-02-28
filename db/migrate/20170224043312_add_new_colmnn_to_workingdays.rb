class AddNewColmnnToWorkingdays < ActiveRecord::Migration
  def change
  	add_column :workingdays, :paid, :boolean
  end
end
