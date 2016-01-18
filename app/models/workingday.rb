class Workingday < ActiveRecord::Base
  belongs_to :employee
  has_many :salaryslips
end
