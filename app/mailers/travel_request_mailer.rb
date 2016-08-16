class TravelRequestMailer < ApplicationMailer
   
    def travel_request(travel_request)
     @reporting_master = ReportingMaster.find(travel_request.reporting_master_id)
     @employee = Employee.find(@reporting_master.employee_id)
     # @employee = Employee.find(travel_request.reporting_master_id)
     @travel_request = TravelRequest.find(travel_request.id)
     @emp = TravelRequest.find_by_employee_id(travel_request.employee_id)
     mail(to: @employee.email, subject: 'Travel Request')

    end

    def approve_travel_request_email(travel_request)
    @travel_request = travel_request
    @reporting_master = Employee.find(travel_request.reporting_master_id)
    @travel_request = TravelRequest.find(travel_request.id)
    @employee = Employee.find(@travel_request.employee_id)
    @emp = TravelRequest.find_by_employee_id(travel_request.employee_id)
    @rep1 = Employee.find(travel_request.reporting_master_id)
    mail(to: @employee.email, subject: 'Travel Request Approved')
    end

 
    def reject_travel_request_email(travel_request)
    @travel_request = travel_request
    @reporting_master = Employee.find(travel_request.reporting_master.employee_id)
    @travel_request = TravelRequest.find(travel_request.id)
    @employee = Employee.find(@travel_request.employee_id)
    @emp = TravelRequest.find_by_employee_id(travel_request.employee_id)
    @rep1 = Employee.find(travel_request.reporting_master_id)
    mail(to: @employee.email, subject: 'Travel Request Rejected')
    end

end
