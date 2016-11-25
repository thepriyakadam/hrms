class AddColToLeavCategories < ActiveRecord::Migration
  def change
    add_column :leav_categories, :is_cashable, :boolean
  end
end
