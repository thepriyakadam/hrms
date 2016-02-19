class EmployeeLeavRequest < ActiveRecord::Base
  enum current_status: [:Pending, :Cancelled, :FirstApproved, :SecondApproved, :FirstRejected, :SecondRejected]
  belongs_to :employee
  belongs_to :leav_category
  has_one :leav_cancelled
  has_one :leav_approved
  has_one :leav_rejected
  has_many :leave_status_records
  has_many :particular_leave_records

  belongs_to :first_reporter, class_name: "Employee"
  belongs_to :second_reporter, class_name: "Employee"
end
