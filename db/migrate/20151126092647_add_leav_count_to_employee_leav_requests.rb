class AddLeavCountToEmployeeLeavRequests < ActiveRecord::Migration
  def change
    add_column :employee_leav_requests, :leave_count, :decimal, :precision => 5, :scale => 1
  end
end
