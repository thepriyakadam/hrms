module ReportingMastersHelper
  def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end

  def employee_list_by_company_location
    if current_user.class == Group
      Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }
    else
      if current_user.role.name == 'Company'
        Employee.all.collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.middle_name.to_s + ' '+ e.last_name.to_s, e.id] }
      elsif current_user.role.name == 'CompanyLocation' || current_user.role.name == "SalaryAccount"
        Employee.where(company_location_id: current_user.company_location_id).collect { |e| [e.manual_employee_code + '  ' + e.first_name.to_s + ' ' + e.last_name.to_s, e.id] }  
      end
    end
  end

  def all_expences_reporting_master_expences_list
     ReportingMaster.where(is_expences: true,is_active: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end
  
  def all_training_reporting_master_list
     ReportingMaster.where(is_training: true,is_active: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end
  
  def all_recruitment_reporting_master_list
     ReportingMaster.where(is_recruitment: true,is_active: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_resignation_reporting_master_list
     ReportingMaster.where(is_resignation: true,is_active: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_transfer_reporting_master_list
    ReportingMaster.where(is_transfer: true,is_active: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_promotion_reporting_master_list
     ReportingMaster.where(is_promotion: true,is_active: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end


  def all_reporting_master_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:middle_name).to_s + ' '+ e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end


  def all_reporting_master_list1
    ReportingMaster.where.not(employee_id: current_user.employee_id).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end
end
