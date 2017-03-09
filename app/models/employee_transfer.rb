class EmployeeTransfer < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :employee_designation
  belongs_to :employee_category
  belongs_to :company
  belongs_to :company_location
  belongs_to :department
  validates :reporting_master_id,presence:true
  validates :employee_id,presence:true
  validates :departemnt,presence:true
end
