class ResignationStatusRecord < ActiveRecord::Base
  belongs_to :employee_resignation
  belongs_to :change_status_employee
  belongs_to :employee_resignation
end
