class Salaryslip < ActiveRecord::Base
  belongs_to :employee
  belongs_to :template
  belongs_to :workingday
end
