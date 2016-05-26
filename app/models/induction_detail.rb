class InductionDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :induction_master
end
