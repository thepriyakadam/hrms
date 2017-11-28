module BanksHelper
	def all_banks
		Bank.all.collect { |x| [x.name, x.id] }
	end

	def all_bank_name
        Bank.all.collect { |s| [s.name, s.id] }
    end 
end
