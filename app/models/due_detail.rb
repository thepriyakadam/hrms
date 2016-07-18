class DueDetail < ActiveRecord::Base
  belongs_to :due_employee_template
  belongs_to :reporting_master
end
