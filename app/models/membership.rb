class Membership < ActiveRecord::Base
  belongs_to :employee
  belongs_to :membership_type

  has_many :membership_contributions
  has_many :membership_balances
  has_many :loan_requests
  has_many :loan_approval

  validates :employee_id, presence:true ,uniqueness:{case_sensitive:false}
end
