module CompaniesHelper
  # def all_company
  #   Company.all.collect { |x| [x.name, x.id] }
  # end

  def all_company
    if current_user.class == Group
      Company.all.collect { |x| [x.name, x.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        Company.all.collect { |x| [x.name, x.id] }
      elsif current_user.role.name == 'Admin'
        Company.where(id: current_user.company_location.company_id).collect { |x| [x.name, x.id] }
      elsif current_user.role.name == 'Branch'
        Company.where(id: current_user.company_location_id).collect { |x| [x.name, x.id] }
      end
    end
  end
end
