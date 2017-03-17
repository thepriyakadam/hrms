class EmployeeTransfer < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :employee_designation
  belongs_to :employee_category
  belongs_to :company
  belongs_to :company_location
  belongs_to :department
  # validates :reporting_master_id,presence:true
  # validates :employee_id,presence:true
  # validates :departemnt,presence:true


  def is_available?
    flag = 0
    flag1 = 0
    flag2 = 0
   
      flag = EmployeeTransfer.exists?(employee_id: self.employee_id,current_status: 'Pending') ||
      flag1 = EmployeeTransfer.exists?(employee_id: self.employee_id,current_status: 'FirstApproved') ||
      flag2 = EmployeeTransfer.exists?(employee_id: self.employee_id,current_status: 'SecondApproved') 
    flag
    flag1
    flag2
   
  end

end
