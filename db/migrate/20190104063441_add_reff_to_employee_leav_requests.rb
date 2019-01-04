class AddReffToEmployeeLeavRequests < ActiveRecord::Migration
  def change
    add_reference :employee_leav_requests, :employee_leav_balance, index: true, foreign_key: true
  end
end
