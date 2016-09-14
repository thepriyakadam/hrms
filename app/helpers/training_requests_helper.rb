module TrainingRequestsHelper
	def all_training_topic
		TrainingTopicMaster.all.collect { |t| [t.name, t.id] }
	end
	def all_department_list
    Department.all.collect { |d| [d.company_location.company.name + '-' + d.company_location.name + '-' + d.name, d.id] }
  end
  # def all_reporting_master_list
  #  ReportingMaster.all.collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
  # end

  
 # def all_reporting_master_list1
 #    @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
 #    # @c1=ReportingMastersTrainingReq.where(reporting_master_id: @reporting_masters.id).take
 #    @c1=ReportingMastersTrainingReq.where(training_request_id: @training_request.id,reporting_master_id: @reporting_masters).pluck(:reporting_master_id)
 #    # @reporting_masters = ReportingMaster.where(employee_id: current_user.employee_id).pluck(:id)
 #    # ReportingMastersTravelRequest.where(reporting_master_id: @reporting_masters,travel_request_id: @travel_request.id).update_all(travel_status: "Approved")
 #    ReportingMaster.where.not(id: @c1).collect { |e| [e.try(:employee).try(:manual_employee_code).to_s + ' ' + e.try(:employee).try(:first_name).to_s + ' ' + e.try(:employee).try(:last_name).to_s, e.id] }
 #  end
end
