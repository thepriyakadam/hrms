class AddEmployeePlanToTravelRequest < ActiveRecord::Migration
  def change
    add_reference :travel_requests, :employee_plan, index: true, foreign_key: true
  end
end
