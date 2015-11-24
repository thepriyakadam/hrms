class CompanyLeav < ActiveRecord::Base
  belongs_to :employee_grade
  belongs_to :leav_category
end
