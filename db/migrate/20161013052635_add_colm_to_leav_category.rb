class AddColmToLeavCategory < ActiveRecord::Migration
  def change
  	add_column :leav_categories, :is_balance, :boolean
    add_column :leav_categories, :limit, :string
  end
end
