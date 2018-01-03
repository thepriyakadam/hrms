class Recruiter < ActiveRecord::Base
  belongs_to :employee
  has_many :vacancy_requests
  has_many :vacancy_masters

  validates :employee_id, presence: true,  uniqueness: { case_sensitive: false }

 def self.import(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee == nil
        else
        employee_id = @employee.id
        status = spreadsheet.cell(i,'C')
        if status == "Yes" || status == "yes"
          status = true
        else
          status = false
        end
        
        @emp = Recruiter.find_by(employee_id: employee_id)
        if @emp.nil?
        @recruiter = Recruiter.create(employee_id: employee_id,status: status)
        else
        @emp.update(employee_id: employee_id,status: status)
      end
    end

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
