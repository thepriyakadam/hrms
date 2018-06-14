class ComplianceType < ActiveRecord::Base
	has_many :transaction_records
end
