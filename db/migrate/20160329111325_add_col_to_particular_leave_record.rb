class AddColToParticularLeaveRecord < ActiveRecord::Migration
  def change
    add_column :particular_leave_records, :is_cancel_after_approve, :boolean
  end
end
