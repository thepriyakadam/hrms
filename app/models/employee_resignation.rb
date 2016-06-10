class EmployeeResignation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leaving_reason

  validates :resignation_date,presence:true
 
  validates :employee_id,presence:true


  
end
