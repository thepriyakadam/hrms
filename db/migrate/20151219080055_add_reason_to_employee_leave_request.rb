class AddReasonToEmployeeLeaveRequest < ActiveRecord::Migration
  def change
    add_column :employee_leav_requests, :reason, :string
  end
end
