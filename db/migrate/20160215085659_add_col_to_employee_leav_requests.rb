class AddColToEmployeeLeavRequests < ActiveRecord::Migration
  def change
    add_column :employee_leav_requests, :is_pending, :boolean
    add_column :employee_leav_requests, :is_cancelled, :boolean
    add_column :employee_leav_requests, :is_first_approved, :boolean
    add_column :employee_leav_requests, :is_second_approved, :boolean
    add_column :employee_leav_requests, :is_first_rejected, :boolean
    add_column :employee_leav_requests, :is_second_rejected, :boolean
    add_column :employee_leav_requests, :current_status, :integer
    add_reference :employee_leav_requests, :first_reporter, index: true, foreign_key: true
    add_reference :employee_leav_requests, :second_reporter, index: true, foreign_key: true
  end
end
