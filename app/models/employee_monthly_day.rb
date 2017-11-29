class EmployeeMonthlyDay < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
end
