module CostCentersHelper
	def all_cost_center
		CostCenter.all.collect { |c| [c.name,c.id] }
	end

	def all_cost_center
       CostCenter.all.collect { |x| [x.name, x.id] }
    end
end
