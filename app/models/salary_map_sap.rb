class SalaryMapSap < ActiveRecord::Base
  belongs_to :salary_component
  belongs_to :company
  belongs_to :company_location
	# validates :salary_component_id, presence:true
	# validates :account_code, presence:true
	#validates :is_debit, presence:true
end
