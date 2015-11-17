class JoiningDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_grade
end
