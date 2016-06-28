module EmployeesHelper
  def all_employee_type
    EmployeeType.all.collect { |x| [x.name, x.id] }
  end
  
  def all_active_employee_with_code
  Employee.where(status: "Active").collect {|e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:first_name).to_s+ ' ' + e.try(:middle_name).to_s + ' ' + e.try(:last_name).to_s, e.id]}
  end



  def all_blood_group
    BloodGroup.all.collect { |x| [x.name, x.id] }
  end

  def all_nationality
    Nationality.all.collect { |x| [x.name, x.id] }
  end

  def all_employee_grade
    EmployeeGrade.all.collect { |x| [x.name, x.id] }
  end

  def all_role_list
    Role.all.collect { |r| [r.name, r.id] }
  end

  def all_religions
    Religion.all.collect { |r| [r.name, r.id] }
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
      if current_user.role.name == 'Company'
        Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'CompanyLocation' || current_user.role.name == "SalaryAccount"
        Employee.where(company_location_id: current_user.company_location_id).collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }  
      end
    end
  end
end
