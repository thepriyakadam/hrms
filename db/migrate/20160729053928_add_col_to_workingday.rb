class AddColToWorkingday < ActiveRecord::Migration
  def change
    add_column :workingdays, :is_confirm, :boolean
  end
end
