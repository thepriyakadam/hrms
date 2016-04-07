class Reports::BankDetailsController < ApplicationController
  def new
  end

  def bank_detail_report
   @employee_bank_details = EmployeeBankDetail.all
  end

  # def bank_detail_report
  #  @employee_bank_details = EmployeeBankDetail.all
  # end
#   def bank_detail_report
#   	if current_user.class == Group
#   		if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
#   			@employee_bank_details = EmployeeBankDetail.all
#   		else
#   			@employee_bank_details = EmployeeBankDetail.where(company_location_id: params[:salary][:company_location_id])
#   		end 
#   	elsif current_user.class == Member
#   		if current_user.role.name == "Company"
#   			if params[:salary][:company_location_id] == "" or params[:salary][:company_location_id].nil?
#   				@employee_bank_details = EmployeeBankDetail.all
#   			else
#   				@employee_bank_details = EmployeeBankDetail.where(company_location_id: params[:salary][:company_location_id])
#   			end 
#   		elsif current_user.role.name == "CompanyLocation"
#   			@employee_bank_details = EmployeeBankDetail.where(company_location_id: current_user.company_location_id)
#   		elsif current_user.role.name == "Department"
#   			@employee_bank_details = EmployeeBankDetail.where(department_id: current_user.department_id)
#    		elsif current_user.role.name == "Superviser"
#   		elsif current_user.role.name == "Employee"
#   		end
#   	end
# end
end
