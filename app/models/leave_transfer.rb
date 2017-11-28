class LeaveTransfer < ActiveRecord::Base
  belongs_to :employee
  belongs_to :transfer_to, class_name: 'Employee'
  belongs_to :employee_leav_balance
  belongs_to :leav_category
end
