module RembursmentmastersHelper

	def all_rembursment
		Rembursmentmaster.all.collect {|lr| [lr.name, lr.id] }
	end
end
