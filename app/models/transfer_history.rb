class TransferHistory < ActiveRecord::Base
  belongs_to :employee_transfer
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :employee_designation
  belongs_to :employee_category
  belongs_to :company
  belongs_to :company_location
  belongs_to :department
end
