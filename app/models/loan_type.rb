class LoanType < ActiveRecord::Base
	has_many :loan_requests
	has_many :loan_approval
end
