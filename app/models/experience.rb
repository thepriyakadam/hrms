class Experience < ActiveRecord::Base
  belongs_to :employee

  validates :no_of_year, presence: true
  validates :company_name, presence: true
  validates :designation, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |experience|
        csv << experience.attributes.values_at(*column_names)
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
        company_name = spreadsheet.cell(i,'C')
        designation = spreadsheet.cell(i,'D')
        start_date = spreadsheet.cell(i,'E')
        end_date = spreadsheet.cell(i,'E')
        no_of_year = spreadsheet.cell(i,'F')
        ctc = spreadsheet.cell(i,'G')
        description = spreadsheet.cell(i,'H')

        @experience = Experience.create(employee_id: employee_id,company_name: company_name,designation: designation,start_date: start_date,end_date: end_date,no_of_year: no_of_year,ctc: ctc,description: description)
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
