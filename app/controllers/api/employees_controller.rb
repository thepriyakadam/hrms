require 'open-uri'
class Api::EmployeesController < ApplicationController
	 def employee_list
    @employee = params[:employee_id]
    employees = Employee.where(id: @employee) 
      render :json => employees.present? ? employees.collect{|e| {:id => e.id,:manual_employee_code => e.manual_employee_code,:first_name => e.first_name,:middle_name => e.middle_name,:last_name => e.last_name,:date_of_birth => e.date_of_birth,
:gender => e.gender,:contact_no => e.contact_no,:optinal_contact_no => e.optinal_contact_no,:optinal_contact_no1 => e.optinal_contact_no1,:email => e.email,:optional_email => e.optional_email,:permanent_address => e.permanent_address,:country_id => e.country_id,:state_id => e.state_id,:district_id => e.district_id,:city => e.city,:pin_code => e.pin_code,:current_address => e.current_address,:adhar_no => e.adhar_no,:pan_no => e.pan_no,:licence_no => e.licence_no,:marital_status => e.marital_status,:blood_group_id => e.blood_group_id,:employee_type_id => e.employee_type_id,:nationality_id => e.nationality_id,:religion_id => e.religion_id,:handicap => e.handicap,:handicap_type => e.handicap_type,:status => e.status,:manager_id => e.manager_id,:manager_2_id => e.manager_2_id,:company_id => e.company_id,:company_location_id => e.company_location_id,:department_id => e.department_id,:sub_department_id => e.sub_department_id,:extension_no => e.extension_no,:emergency_contact_no => e.emergency_contact_no}} : []
  end
end