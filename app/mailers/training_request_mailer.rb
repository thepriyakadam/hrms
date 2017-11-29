class TrainingRequestMailer < ApplicationMailer

	 def approve_training_request_email(training_request)
    @training_request = training_request
    # @reporting_master = Employee.find(travel_request.reporting_master_id)
    # @travel_request = TravelRequest.find(travel_request.id)
    @employee = Employee.find(@training_request.employee_id)
    # @emp = TravelRequest.find_by_employee_id(travel_request.employee_id)
    # @rep1 = Employee.find(travel_request.reporting_master_id)
    mail(to: @employee.email, subject: 'Training Request Approved')
    end

    def reject_training_request_email(training_request)
    @travel_request = training_request
    @employee = Employee.find(@training_request.employee_id)
    mail(to: @employee.email, subject: 'Training Request Rejected')
    end

    def training_request(training_request)
     @reporting_master = ReportingMaster.find(training_request.reporting_master_id)
     @employee = Employee.find(@reporting_master.employee_id)
     @training_request = TrainingRequest.find(training_request.id)
     @emp = TrainingRequest.find_by_employee_id(training_request.employee_id)
     mail(to: @employee.email, subject: 'Training Request')
    end


end
