class AddColToEmployeeLeavRequest < ActiveRecord::Migration
  def change
    add_column :employee_leav_requests, :first_half, :boolean
    add_column :employee_leav_requests, :last_half, :boolean
  end
end
