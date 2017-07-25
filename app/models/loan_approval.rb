class LoanApproval < ActiveRecord::Base
  belongs_to :loan_request
  belongs_to :membership
  belongs_to :loan_type
  belongs_to :approval

  has_many :loan_emis
end
