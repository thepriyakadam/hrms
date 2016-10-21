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
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_reporting_master_employee_id_list
    ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.employee_id] }
  end

  def all_expences_reporting_master_expences_list
    ReportingMaster.where(is_expences: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end
  
  def all_recruitment_reporting_master_list
    ReportingMaster.where(is_recruitment: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_training_reporting_master_list
    ReportingMaster.where(is_training: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_resignation_reporting_master_list
    ReportingMaster.where(is_resignation: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_transfer_reporting_master_list
    ReportingMaster.where(is_transfer: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

  def all_promotion_reporting_master_list
    ReportingMaster.where(is_promotion: true).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' '+ e.try(:employee).try(:middle_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end

end
