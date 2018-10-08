class ComplianceType < ActiveRecord::Base
	has_many :transaction_records
	has_many :compliance_records
end
