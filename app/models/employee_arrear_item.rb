class EmployeeArrearItem < ActiveRecord::Base
  belongs_to :employee_arrear
  belongs_to :salary_component
end
