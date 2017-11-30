class EmployeeCodeMaster < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { case_sensitive: true }
	validates :range, presence: true

  def self.import_employee_code_master(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        name = spreadsheet.cell(i,'A')
        range = spreadsheet.cell(i,'B').to_i
        last_range = spreadsheet.cell(i,'C').to_i
        is_active = spreadsheet.cell(i,'D')
        if is_active == "Yes" || is_active == "yes"
          is_active = true
        else
          is_active = false
        end
        @employee_code_master = EmployeeCodeMaster.create(name: name,range: range,last_range: last_range,is_active: is_active)     
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
