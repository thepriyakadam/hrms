class AddColumToWorkingdays < ActiveRecord::Migration
  def change
    add_column :workingdays, :from, :date
    add_column :workingdays, :to, :date
  end
end
