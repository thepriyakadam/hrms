module CompanyLocationsHelper
  def all_company_with_location
    CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
  end
   def all_company_location
    CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
  end
  def all_company_location
    CompanyLocation.all.collect { |x| [x.name, x.id] }
  end

  def all_company_location2
    if current_user.class == Group
      CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      elsif current_user.role.name == 'Admin'
        CompanyLocation.where(company_id: current_user.company_location.company_id).collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      elsif current_user.role.name == 'Branch'
        CompanyLocation.where(id: current_user.company_location_id).collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      elsif current_user.role.name == 'HOD'
        Department.where(id: current_user.department_id).collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      elsif current_user.role.name == 'Recruitment'
      CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      end
    end
  end

  def all_company_location_role_wise
    if current_user.class == Group
      CompanyLocation.all.collect { |cl| [cl.name , cl.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        CompanyLocation.all.collect { |cl| [cl.name , cl.id] }
      elsif current_user.role.name == 'Admin'
        CompanyLocation.where(company_id: current_user.company_location.company_id).collect { |cl| [cl.name , cl.id] }
      elsif current_user.role.name == 'Branch'
        CompanyLocation.where(id: current_user.company_location_id).collect { |cl| [cl.name , cl.id] }
      elsif current_user.role.name == 'HOD'
        Department.where(id: current_user.department_id).collect { |cl| [cl.name , cl.id] }
         elsif current_user.role.name == 'Recruitment'
      CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      end
    end
  end
  
  def role_location_list
   if current_user.class == Group
      CompanyLocation.all.collect { |d| [d.company.name + '-' + d.name , d.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        CompanyLocation.all.collect { |d| [d.company.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'Admin'
        CompanyLocation.where(company_id: current_user.company_location.company_id).collect { |d| [d.company.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'Branch'
        CompanyLocation.where(id: current_user.company_location_id).collect { |d| [d.company.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'HOD'
        CompanyLocation.where(id: current_user.company_location_id).collect { |d| [d.company.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'Recruitment'
        CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      end
    end
  end

end
