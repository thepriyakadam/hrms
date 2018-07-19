module RegularizationReasonsHelper
	def all_regularization_reason
		RegularizationReason.all.collect {|e| [e.try(:name).to_s, e.id]}
	end
end
