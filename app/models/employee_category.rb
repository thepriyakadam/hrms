class EmployeeCategory < ActiveRecord::Base
  has_many :joining_details
  has_many :employee_promotions
  has_many :promotion_histories
  validates :name, presence: true
  validates :code, presence: true


    def self.import_employee_category(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'A')
        name = spreadsheet.cell(i,'B')
        description = spreadsheet.cell(i,'C')
        is_active = spreadsheet.cell(i,'D')
        if is_active == "Yes" || is_active == "yes"
        	is_active = true
        else
        	is_active = false
        end


        @employee_category = EmployeeCategory.create(code: code,name: name,description: description,is_active: is_active)     
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
