module DepartmentsHelper
  def all_department_type
    DepartmentType.all.collect { |d| [d.name, d.id] }
  end

  def all_company_with_location
    CompanyLocation.all.collect { |cl| [cl.company.name + '-' + cl.name, cl.id] }
  end

  def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
  
  def all_department_name
     Department.all.collect { |d| [d.name, d.id] }
  end

  def all_department_type_list1
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
end