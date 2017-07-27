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
      if current_user.role.name == 'GroupAdmin'
        Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'Admin'
        @companys = CompanyLocation.where(company_id: current_user.company_location.company_id).pluck(:id)
        Department.where(company_location_id: @companys).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'Branch'
        Department.where(company_location_id: current_user.company_location_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      elsif current_user.role.name == 'HOD'
        Department.where(id: current_user.department_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      else
        @department_id = Employee.where(id: current_user.employee_id).pluck(:department_id)
        Department.where(id: @department_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
      end
    end
  end

   def all_department_type_list2
      if current_user.class == Group
        Department.all.collect { |d| [d.company_location.name + '-' + d.name, d.id] }
      else
        if current_user.role.name == 'GroupAdmin'
          Department.all.collect { |d| [d.company_location.name + '-' + d.name, d.id] }
        elsif current_user.role.name == 'Admin'
          @companys = CompanyLocation.where(company_id: current_user.company_location.company_id).pluck(:id)
          Department.where(company_location_id: @companys).collect { |d| [d.company_location.name + '-' + d.name, d.id] }
          elsif current_user.role.name == 'Branch'
          Department.where(company_location_id: current_user.company_location_id).collect { |d| [d.company_location.name + '-' + d.name, d.id] }
          elsif current_user.role.name == 'HOD'
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
  

  # def all_department_type_list1
  #   if current_user.class == Group
  #     Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  #   else
  #     if current_user.role.name == 'GroupAdmin'
  #       Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  #     elsif current_user.role.name == 'Admin'
  #       Department.where(company_location_id: current_user.company_id).collect { |d| [d.company.name + '-' + d.company.name + '-' + d.name, d.id] }
  #     elsif current_user.role.name == 'Branch'
  #       Department.where(company_location_id: current_user.company_location_id).collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  #     end
  #   end
  # end
end