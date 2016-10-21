class AddColToLeaveCategory < ActiveRecord::Migration
  def change
  	 add_column :leav_categories, :is_limit, :boolean
  	 remove_column :particular_leave_records, :is_limit, :boolean
  end
end
