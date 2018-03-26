class ReportingMastersResign < ActiveRecord::Base
  belongs_to :employee_resignation
  belongs_to :reporting_master
end
