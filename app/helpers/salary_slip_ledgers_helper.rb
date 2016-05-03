module SalarySlipLedgersHelper
   
   def all_bank_name
   	  EmployeeBankDetail.uniq.pluck(:bank_name)
    # EmployeeBankDetail.all.collect { |s| [s.bank_name, s.id] }
   end

end
