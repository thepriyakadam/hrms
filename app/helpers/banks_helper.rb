module BanksHelper
	def all_banks
		Bank.all.collect { |x| [x.name, x.id] }
	end
end
