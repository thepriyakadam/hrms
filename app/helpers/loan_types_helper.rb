module LoanTypesHelper

	def all_loan_type
    LoanType.all.collect { |x| [x.name, x.id] }
  end
end
