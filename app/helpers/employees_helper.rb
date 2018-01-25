module EmployeesHelper
  # def nested_employees(employees)
  #   employees.map do |employee, sub_employee|
  #     render(employee) + content_tag(:div, nested_employees(sub_employee), :class => "nested_employees")
  #   end.join.html_safe
  # end

  def all_active_employee_with_code
  Employee.where(status: "Active").collect {|e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
  end
  
  def all_inactive_employee_with_code
  Employee.where(status: "Inactive").collect {|e| [e.try(:manual_employee_code).to_s + ' ' +e.try(:prefix).to_s + ' ' + e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
  end

  def all_employee_list
    Employee.where(status: "Active").collect { |e| [e.try(:manual_employee_code).to_s + ' ' +e.try(:prefix).to_s + ' ' + e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id] }
  end

  def check_if_true(item)
    if item == 'true' || item == true || item == 1 || item == '1'
      return true
    else
      return false
    end
  end

  def employee_list_for_food_deduction
    if current_user.class == Group
      Employee.where(status: "Active").collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.where(status: "Active").collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
      elsif current_user.role.name == 'Admin'
        Employee.where(status: "Active",company_id: current_user.company_location.company_id).collect { |e| [e.manual_employee_code + '  ' +e.try(:prefix).to_s + ' ' + e.try(:first_name).to_s + ' ' + e.try(:middle_name).to_s+' '+e.try(:last_name).to_s, e.id] }
      elsif current_user.role.name == 'Branch'
        Employee.where(status: "Active",company_location_id: current_user.company_location_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' + e.try(:middle_name).to_s+' '+e.try(:last_name).to_s, e.id] }
      end
    end
  end

  def role_employee_list
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
        @employees = @emp.subordinates
           elsif current_user.role.name == 'CEO'
        @emp = Employee.find(current_user.employee_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
        @employees = @emp.subordinates
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
  end

  def full_name(emp)
    emp.try(:prefix).to_s + ' ' +emp.try(:first_name).to_s + ' ' + emp.try(:middle_name).to_s + ' ' + emp.try(:last_name).to_s
  end

  def code_full_name(emp)
    emp.try(:manual_employee_code).to_s+' '+emp.try(:prefix).to_s + ' ' +emp.try(:first_name).to_s+' '+emp.try(:middle_name).to_s+' '+emp.try(:last_name).to_s
  end

  def short_name(emp)
    emp.try(:prefix).to_s + ' ' +emp.try(:first_name).to_s + ' ' + emp.try(:last_name).to_s
  end

  def employee_list_by_company_location
    if current_user.class == Group
      Employee.where(status: "Active").collect { |e| [e.manual_employee_code + '  ' +e.try(:prefix).to_s + ' ' + e.first_name.to_s + ' ' +e.try(:middle_name).to_s + ' ' +  e.last_name.to_s, e.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.where(status: "Active").collect { |e| [e.manual_employee_code + '  ' +e.try(:prefix).to_s + ' ' + e.first_name.to_s + ' ' + e.try(:middle_name).to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'Admin'
        Employee.where(company_id: current_user.company_location.company_id,status: "Active").collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.first_name.to_s + ' ' + e.try(:middle_name).to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'Branch'
        Employee.where(company_location_id: current_user.company_location_id,status: "Active").collect { |e| [e.manual_employee_code + '  ' +e.try(:prefix).to_s + ' ' + e.first_name.to_s + ' ' + e.try(:middle_name).to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == "AccountAdmin"
        Employee.where(company_location_id: current_user.company_id,status: "Active").collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.first_name.to_s + ' ' + e.try(:middle_name).to_s + ' ' + e.last_name.to_s, e.id] }
      elsif  current_user.role.name == 'HOD'
        Employee.where(department_id: current_user.department_id,status: "Active").collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.first_name.to_s + ' ' +e.try(:middle_name).to_s + ' ' + e.last_name.to_s, e.id] }
      end
    end
  end

  def role_employee_list
    if current_user.class == Member
      if current_user.role.name == 'Supervisor' || current_user.role.name == 'GroupAdmin' || current_user.role.name == 'Admin' || current_user.role.name == 'Branch' || current_user.role.name == 'HOD'  || current_user.role.name == 'CEO'
        @emp = Employee.find_by(id: current_user.employee_id)
        @employees = @emp.subordinates.collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id).collect { |e| [e.manual_employee_code + '  ' + e.try(:prefix).to_s + ' ' +e.try(:first_name).to_s + ' ' +e.try(:middle_name).to_s+' '+ e.try(:last_name).to_s, e.id] }
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
  end
  
end
