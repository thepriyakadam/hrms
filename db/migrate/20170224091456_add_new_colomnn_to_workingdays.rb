class AddNewColomnnToWorkingdays < ActiveRecord::Migration
  def change
  	add_column :workingdays, :full_and_final, :boolean
  end
end
