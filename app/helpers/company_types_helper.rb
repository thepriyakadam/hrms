module CompanyTypesHelper
  def all_company_type
    CompanyType.all.collect { |x| [x.name, x.id] }
  end
end
