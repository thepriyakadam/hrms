module CompaniesHelper
  def all_company_type
    CompanyType.all.collect { |x| [x.name, x.id] }
  end

  def all_company
    Company.all.collect { |x| [x.name, x.id] }
  end

  def all_countries
    Country.all.collect { |c| [c.name, c.id] }
  end
end
