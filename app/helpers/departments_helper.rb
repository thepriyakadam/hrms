module DepartmentsHelper
  def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
  
  def all_department_name
     Department.all.collect { |d| [d.name, d.id] }
  end

  def all_department_type_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end

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

   def all_department_type_list2
     if current_user.class == Group
      Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
    else
      if current_user.role.name == 'Company'
        Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'CompanyLocation'
        Department.where(company_location_id: current_user.company_location_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
        elsif current_user.role.name == 'Department'
        Department.where(id: current_user.department_id).collect { |d| [d.company_location.name + '-' + d.name, d.id] }
      end
    end
  end


  def all_department
    Department.all.collect { |x| [x.company_location.name + '-' + x.name, x.id] }
  end

  def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
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