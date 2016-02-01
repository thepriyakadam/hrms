class AdvanceSalary < ActiveRecord::Base
  belongs_to :employee
  has_many :instalments
  
end
