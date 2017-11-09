class AddColToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :is_confirm, :boolean
  end
end
