class AddNewColumnToLeavCategories < ActiveRecord::Migration
  def change
    add_column :leav_categories, :is_active, :boolean
  end
end
