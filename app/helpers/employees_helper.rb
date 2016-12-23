module EmployeesHelper
  def all_active_employee_with_code
  Employee.where(status: "Active").collect {|e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
  end
  
  def all_inactive_employee_with_code
  Employee.where(status: "Inactive").collect {|e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
  end

  def all_employee_list
    Employee.all.collect { |e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id] }
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
      Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'Admin'
        Employee.where(company_location_id: current_user.company_id).collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'Branch'
        Employee.where(company_location_id: current_user.company_location_id).collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      end
    end
  end

  def full_name(emp)
    emp.try(:first_name).to_s + ' ' + emp.try(:middle_name).to_s + ' ' + emp.try(:last_name).to_s
  end

  def code_full_name(emp)
    emp.try(:manual_employee_code).to_s+' '+emp.try(:first_name).to_s+' '+emp.try(:middle_name).to_s+' '+emp.try(:last_name).to_s
  end

  def short_name(emp)
    emp.try(:first_name).to_s + ' ' + emp.try(:last_name).to_s
  end

  def employee_list_by_company_location
    if current_user.class == Group
      Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
    else
      if current_user.role.name == 'GroupAdmin'
        Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'Admin' || current_user.role.name == "Account"
        Employee.where(company_location_id: current_user.company_id).collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'Branch' || current_user.role.name == "Account"
        Employee.where(company_location_id: current_user.company_location_id).collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      end
    end
  end
end
