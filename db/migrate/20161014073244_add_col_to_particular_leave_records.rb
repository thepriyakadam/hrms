class AddColToParticularLeaveRecords < ActiveRecord::Migration
  def change
  	 add_column :particular_leave_records, :is_limit, :boolean
  end
end
