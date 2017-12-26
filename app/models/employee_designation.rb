class EmployeeDesignation < ActiveRecord::Base
  has_many :joining_details
  has_many :vacancy_masters
  has_many :capture_resumes
  has_many :vacancy_request_histories
  has_many :employee_promotions
  has_many :promotion_histories
  has_many :vacancy_requests
  has_many :change_designations

  has_many :goal_bunches, class_name: "EmployeeDesignation",
                          foreign_key: "r_designation_id"

  has_many :goal_bunches, class_name: "EmployeeDesignation",
                          foreign_key: "f_designation_id"
                          
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :reimbursement_slabs
  def self.filter_records(current_user)
    @employee_designations =  if current_user.class == Group
      EmployeeDesignation.all
    elsif current_user.class == Member
      if current_user.role.name == "GroupAdmin"
         @employees = Employee.all
         EmployeeDesignation.where(employee_id: @employees)
      elsif current_user.role.name == "Admin"
        @employees = Employee.where(company_id: current_user.company_location.company_id).pluck(:id)
        EmployeeDesignation.where(employee_id: @employees)
      elsif current_user.role.name == "Branch"
        @employees = Employee.where(company_location_id: current_user.company_location_id).pluck(:id)
        EmployeeDesignation.where(employee_id: @employees)    
      elsif current_user.role.name == "HOD"
        @employees = Employee.where(department_id: current_user.department_id).pluck(:id)
        EmployeeDesignation.where(employee_id: @employees)
      elsif current_user.role.name == "Employee"
        EmployeeDesignation.where(employee_id: current_user.employee_id)
      end
    end
  end


    def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'B')
        name = spreadsheet.cell(i,'C')
        description = spreadsheet.cell(i,'D')

        @designation = EmployeeDesignation.create(code: code,name: name,description: description)     
    end
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
