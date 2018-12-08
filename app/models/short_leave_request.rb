class ShortLeaveRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager, class_name: 'Employee'
  has_many :short_leave_approvals
end
