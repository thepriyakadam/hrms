class AddColToLeaveCategory < ActiveRecord::Migration
  def change
    add_column :leav_categories, :weekoff_sandwich, :boolean
  end
end
