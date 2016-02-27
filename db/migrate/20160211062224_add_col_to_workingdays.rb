class AddColToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :month, :integer
  end
end
