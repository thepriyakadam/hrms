class TravelRequestMailer < ApplicationMailer
   
    def travel_request(travel_request)
     @employee = Employee.find(travel_request.reporting_master_id)
     @travel_request = TravelRequest.find_by_reporting_master_id(travel_request.reporting_master_id)
     mail(to: @employee.email, subject: 'Travel Request')
    end

    def approve_travel_request_email(travel_request)
     @employee = Employee.find(travel_request.employee_id)
     @travel_request = TravelRequest.find_by_reporting_master_id(travel_request.reporting_master_id)
     mail(to: @employee.email, subject: 'Travel Approve Request')
    end

    def reject_travel_request_email(travel_request)
     @employee = Employee.find(travel_request.employee_id)
     @travel_request = TravelRequest.find_by_reporting_master_id(travel_request.reporting_master_id)
     mail(to: @employee.email, subject: 'Travel Approve Request')
    end

end
