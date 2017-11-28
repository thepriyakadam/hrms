class LoanEmi < ActiveRecord::Base
  belongs_to :loan_approval
end
