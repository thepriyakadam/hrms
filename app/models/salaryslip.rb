class Salaryslip < ActiveRecord::Base
  belongs_to :employee
  belongs_to :template
  belongs_to :workingday
  belongs_to :salary_template
end
