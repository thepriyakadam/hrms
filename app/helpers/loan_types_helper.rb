module LoanTypesHelper

	def all_loan_type
    LoanType.all.collect { |x| [x.name.to_s + ' - ' + x.interest_rate.to_s, x.id] }
  end
end
