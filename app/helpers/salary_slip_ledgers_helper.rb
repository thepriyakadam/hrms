module SalarySlipLedgersHelper
  def all_bank_name
    Bank.all.collect { |s| [s.name, s.id] }
  end

  def category_or_cost(pdf,category)
  	if pdf == "category" and category.present?
  		EmployeeCategory.find(category).name
  	elsif pdf == "cost_center"
  		CostCenter.find(category).name
  	else
  	end
  end
end
