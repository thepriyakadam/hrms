class AddColToLeavCategory < ActiveRecord::Migration
  def change
    add_column :leav_categories, :pre_request, :boolean
  end
end
