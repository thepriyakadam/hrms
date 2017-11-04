class AddColToLeavCategory < ActiveRecord::Migration
  def change
    add_column :leav_categories, :weekoff_sandwich, :boolean
    add_column :leav_categories, :holiday_sandwich, :boolean
  end
end
