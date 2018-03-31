class LoanRequest < ActiveRecord::Base
  belongs_to :membership
  belongs_to :loan_type
  belongs_to :request_to

  has_many :loan_approvals


    def is_there?
    flag = 0
      flag = LoanRequest.exists?(membership_id: self.membership_id,status: 'Pending')
    flag
  end
end
