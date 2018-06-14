class TransactionRecord < ActiveRecord::Base
  belongs_to :compliance_type
end
