class AddColmToEmployeeLeavRequests < ActiveRecord::Migration
  def change
    add_column :employee_leav_requests, :current_status1, :string
  end
end
