class AddColToLeaveCategory < ActiveRecord::Migration
  def change
  	 add_column :leav_categories, :is_limit, :boolean
  end
end
