class AdvanceSalary < ActiveRecord::Base
  belongs_to :employee
  belongs_to :advance_type
  has_many :instalments
  validates :employee_id, presence: true

  def self.filter_records(current_user)
    if current_user.class == Group
      if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
    elsif current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
         if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
       elsif current_user.role.name == 'Admin'
         if @location == ""
          @employees = Employee.where(company_id: @company.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
        elsif current_user.role.name == 'Branch'
         if @location == ""
          @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        elsif @company == ""
          @employees = Employee.where(company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        else 
          @employees = Employee.where(company_id: @company.to_i,company_location_id: @location.to_i).pluck(:id)
          @advance_salaries = AdvanceSalary.where("strftime('%m/%Y', advance_date) = ?", date.strftime('%m/%Y')).where(employee_id: @employees)
        end
      elsif current_user.role.name == 'HOD'
        @salaryslips = Salaryslip.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Superviser'
      elsif current_user.role.name == 'Employee'
      end
  end
end
