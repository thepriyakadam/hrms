module LeavingReasonsHelper
	def all_leaving_reason
		LeavingReason.all.collect {|lr| [lr.name, lr.id] }
	end
end
