module TrainingRequestsHelper
	def all_training_topic
		TrainingTopicMaster.all.collect { |t| [t.name, t.id] }
	end
	def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
  def all_reporting_master_list
   ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  end
end
