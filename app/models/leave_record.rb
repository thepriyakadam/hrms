class LeaveRecord < ActiveRecord::Base
  belongs_to :employee_leav_request
  belongs_to :employee
  belongs_to :leav_category
end
