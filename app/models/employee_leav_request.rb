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

  def create_single_record_for_leave(employee_leav_request)
    if employee_leav_request.leave_type == "Full Day"
      for i in employee_leav_request.start_date.to_date..employee_leav_request.end_date.to_date
        employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leav_category_id: employee_leav_request.leav_category_id, leave_date: i, is_full: true)
      end
    else
      employee_leav_request.particular_leave_records.create(employee_id: employee_leav_request.employee_id, leav_category_id: employee_leav_request.leav_category_id, leave_date: employee_leav_request.start_date, is_full: false)            
    end
  end 
end
