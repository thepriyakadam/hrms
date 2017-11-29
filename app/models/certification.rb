class Certification < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  validates :name, presence: true
  validates :duration, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |certification|
        csv << certification.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee == nil
        else
        employee_id = @employee.id
        name = spreadsheet.cell(i,'C')
        @year = Year.find_by_name(spreadsheet.cell(i,'D'))
        if @year == nil
           year_name = spreadsheet.cell(i,'D')
           @year_entry = Year.create(name: year_name)
           year_id = @year_entry.id
        else
        year_id = @year.id
        end
        duration = spreadsheet.cell(i,'E')
        description = spreadsheet.cell(i,'F')

        @certification = Certification.create(employee_id: employee_id,name: name,year_id: year_id,duration: duration,description: description)
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
