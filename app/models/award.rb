class Award < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  validates :award_name, presence: true
  validates :year_id, presence: true
  validates :award_from, presence: true
  # validate :award_name_regex
  # validate :award_from_regex
  # validates :employee_id, uniqueness: { scope: [:award_name] }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |award|
        csv << award.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        employee_id = @employee.id
        award_name = spreadsheet.cell(i,'C')
        @year = Year.find_by_name(spreadsheet.cell(i,'D'))
        if @year == nil
           year_name = spreadsheet.cell(i,'D')
           @year_entry = Year.create(name: year_name)
           year_id = @year_entry.id
        else
        year_id = @year.id
        end
        award_from = spreadsheet.cell(i,'E')
        description = spreadsheet.cell(i,'F')

        @award = Award.create(employee_id: employee_id,award_name: award_name,year_id: year_id,award_from: award_from,description: description)
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

  def award_name_regex
    if award_name.present? && !award_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :award_name, 'Award Name allows only Characters'
    end
  end

  def award_from_regex
    if award_from.present? && !award_from.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :award_from, 'Award From allows only Characters'
    end
  end
end
