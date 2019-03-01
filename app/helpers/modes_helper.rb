module ModesHelper
	def all_mode
    	Mode.all.collect { |x| [x.name, x.id] }
  	end
end
