class EmployeeResignation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :leaving_reason
  has_many :due_employee_details
  has_many :resignation_status_records
  belongs_to :second_reporter, class_name: 'Employee'
  belongs_to :change_status_employee, class_name: 'Employee'
  belongs_to :final_reporter, class_name: 'Employee'

  validates :resignation_date,presence:true
 
  validates :employee_id,presence:true
  # validates :reporting_master_id,presence:true
  
  # has_many :reporting_masters_resign
  # has_many :reporting_masters, through: :reporting_masters_resign

	def self.stop_payment_request(is_stop)
	  @employee_resignations =  if is_stop == "Yes"
													      EmployeeResignation.where(is_stop_pay_request: true).pluck(:employee_id)
													    else
													      EmployeeResignation.where(is_stop_pay_request: false).pluck(:employee_id)
													    end
	end
end