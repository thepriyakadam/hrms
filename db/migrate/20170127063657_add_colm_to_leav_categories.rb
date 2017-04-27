class AddColmToLeavCategories < ActiveRecord::Migration
  def change
    add_column :leav_categories, :is_continuous, :boolean
  end
end
