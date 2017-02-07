class AddColmnToLeavCategory < ActiveRecord::Migration
  def change
    add_column :leav_categories, :monthly_leave, :decimal
  end
end
