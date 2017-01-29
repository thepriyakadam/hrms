class DueEmployeeDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :due_template
  belongs_to :due_employee_template
  belongs_to :due_detail
  belongs_to :reporting_master
  belongs_to :employee_resignation
  has_many :due_actions
end
