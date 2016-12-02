class AddColumnToLeavCategory < ActiveRecord::Migration
  def change
    add_column :leav_categories, :assign_balance, :boolean
  end
end
