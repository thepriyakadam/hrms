class AddColToLeavCategory < ActiveRecord::Migration
  def change
    add_column :leav_categories, :from, :decimal
    add_column :leav_categories, :to, :decimal
  end
end
