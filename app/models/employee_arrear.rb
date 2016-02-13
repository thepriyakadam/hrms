class EmployeeArrear < ActiveRecord::Base
  belongs_to :employee
  has_many :employee_arrear_items
end
