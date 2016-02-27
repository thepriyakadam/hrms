class HomeController < ApplicationController
  def index
  	@companies = Company.all
  	@company_locations = CompanyLocation.all
  	@departments = Department.all
  	@employees = Employee.all
  	if current_user.class == Member
	  	if current_user.role.name == "Employee"
	  	  @employee = Employee.find(current_user.employee_id)
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.where(company_location_id: current_user.company_location_id)
	    end
    end
  end

  def created_user
    if current_user.class == Group
      @employees = Employee.joins("INNER JOIN members on employees.id = members.employee_id")
    else
      if current_user.role.name == "Company"
        @employees = Employee.joins("INNER JOIN members on employees.id = members.employee_id")
      elsif current_user.role.name == "CompanyLocation"
        @employees = Employee.joins("INNER JOIN members on employees.id = members.employee_id where employees.company_location_id = #{current_user.company_location_id}")
      end
    end
  end
end
