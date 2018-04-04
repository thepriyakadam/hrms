class LeaveStatusRecord < ActiveRecord::Base
  belongs_to :employee_leav_request
  belongs_to :change_status_employee, class_name: 'Employee'
  validates :status, uniqueness: { scope: [:employee_leav_request_id] }
end
