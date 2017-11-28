module LeavingReasonsHelper
	def all_leaving_reason
		LeavingReason.all.collect {|lr| [lr.name, lr.id] }
	end

    def active_leaving_reason
		LeavingReason.where(is_confirm: true).collect {|lr| [lr.name, lr.id] }
	end
end
