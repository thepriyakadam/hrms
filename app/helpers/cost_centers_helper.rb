module CostCentersHelper
	def all_cost_center
		CostCenter.all.collect { |c| [c.name,c.id] }
	end
end
