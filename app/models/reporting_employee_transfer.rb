class ReportingEmployeeTransfer < ActiveRecord::Base
  belongs_to :employee_transfer
  belongs_to :reporting_master
end
