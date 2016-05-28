class InductionDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :induction_master
  validates :employee_id, presence: true
  validates :start_date, presence: true
  validates :induction_master_id, presence: true
end
