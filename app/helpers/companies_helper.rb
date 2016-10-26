module CompaniesHelper
  # def all_company
  #   Company.all.collect { |x| [x.name, x.id] }
  # end

  def all_company
    if current_user.class == Group
      Company.all.collect { |x| [x.name, x.id] }
    else
      if current_user.role.name == 'Company'
        Company.all.collect { |x| [x.name, x.id] }
      elsif current_user.role.name == 'CompanyLocation'
        Company.where(id: current_user.company_location_id).collect { |x| [x.name, x.id] }
      end
    end
  end
end
