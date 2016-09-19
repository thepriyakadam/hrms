module ReportingMastersHelper

  def all_interviewer_name_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
  end

   def all_interviewer_name_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).try(:to_s) + ' ' + e.try(:employee).try(:first_name).try(:to_s) + ' ' + e.try(:employee).try(:last_name).try(:to_s), e.try(:employee).id] }
  end

  def all_reporting_master_list2
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.try(:employee).id] }
  end

  def all_reporting_master_list
   ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end
  
  def all_reporting_master_list1
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end

  def all_expences_reporting_master_expences_list
    ReportingMaster.where(is_expences: true) { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end
  
  def all_recruitment_reporting_master_list
    ReportingMaster.where(is_recruitment: true) { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end

  def all_training_reporting_master_list
    ReportingMaster.where(is_training: true) { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end

  def all_training_reporting_master_list
    ReportingMaster.where(is_training: true) { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end

end
