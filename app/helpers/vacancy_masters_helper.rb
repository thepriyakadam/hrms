module VacancyMastersHelper
  def all_department_type_list1
    if current_user.class == Group
      Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
    else
      if current_user.role.name == 'Company'
        Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'CompanyLocation'
        Department.where(company_location_id: current_user.company_location_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'Department'
        Department.where(id: current_user.department_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      end
    end
  end

  def all_department_type_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end

  #  def all_company_location2
  #   CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
  # end

  #  def all_department_type_list2
  #   Department.all.collect { |d| [d.name, d.id] }
  # end

  def all_company_location2
    if current_user.class == Group
      CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
    else
      if current_user.role.name == 'Company'
        CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      elsif current_user.role.name == 'CompanyLocation'
        CompanyLocation.where(company_location: current_user.company_location_id).collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      elsif current_user.role.name == 'Department'
        Department.where(id: current_user.department_id).collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
      end
    end
  end

  def role_location_list
   if current_user.class == Group
      CompanyLocation.all.collect { |d| [d.company_location.company.name + '-' + d.name , d.id] }
    else
      if current_user.role.name == 'Company'
        CompanyLocation.all.collect { |d| [d.company_location.company.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'CompanyLocation'
        CompanyLocation.where(id: current_user.company_location_id).collect { |d| [d.company.name + '-' + d.name, d.id] }
      end
    end
  end

  def all_department_type_list2
     if current_user.class == Group
      Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
    else
      if current_user.role.name == 'Company'
        Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'CompanyLocation'
        Department.where(company_location_id: current_user.company_location_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      end
    end
  end

  def all_degree_list
    Degree.all.collect { |x| [x.name, x.id] }
 end

 def all_reporting_master_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
  end
end
