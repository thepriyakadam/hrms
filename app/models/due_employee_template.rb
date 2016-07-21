class DueEmployeeTemplate < ActiveRecord::Base
  belongs_to :employee
  belongs_to :due_template
  has_many :due_details
  has_many :due_employee_details
end
