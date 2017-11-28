module ReimbursementHeadsHelper
	def all_reimbursement_head
  	ReimbursementHead.where(status: true).collect {|e| [e.try(:name).to_s, e.id]}
  end
end
