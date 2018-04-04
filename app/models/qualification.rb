class Qualification < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  belongs_to :degree
  belongs_to :degree_type
  belongs_to :degree_stream
  belongs_to :university

  has_many :candidate_forms
   validates :employee_id, presence: true
   validates :marks, presence: true
   # validates :degree_id, presence: true, uniqueness: { case_sensitive: false }
   validates :degree_type_id, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |qualification|
        csv << qualification.attributes.values_at(*column_names)
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
        @degree_type = DegreeType.find_by_name(spreadsheet.cell(i,'C'))
        if @degree_type == nil
           degree_type_name = spreadsheet.cell(i,'C')
           @degree_type_entry = DegreeType.create(name: degree_type_name)
           degree_type_id = @degree_type_entry.id
        else
        degree_type_id = @degree_type.id
        end
        @degree = Degree.find_by_name(spreadsheet.cell(i,'D'))
        if @degree == nil
          degree_name = spreadsheet.cell(i,'D')
           @degree_entry = Degree.create(name: degree_name)
           degree_id = @degree_entry.id
        else
        degree_id = @degree.id
        end
        @degree_stream = DegreeStream.find_by_name(spreadsheet.cell(i,'E'))
        if @degree_stream == nil
          degree_stream_name = spreadsheet.cell(i,'E')
           @degree_stream_entry = DegreeStream.create(name: degree_stream_name)
           degree_stream_id = @degree_stream_entry.id
        else
        degree_stream_id = @degree_stream.id
        end
        marks = spreadsheet.cell(i,'F')
        @year = Year.find_by_name(spreadsheet.cell(i,'G'))
        if @year == nil
          year_name = spreadsheet.cell(i,'G')
           @year_entry = Year.create(name: year_name)
           year_id = @year_entry.id
        else
        year_id = @year.id
        end
        college = spreadsheet.cell(i,'H')
        @university = University.find_by_name(spreadsheet.cell(i,'I'))
        if @university == nil
          university_name = spreadsheet.cell(i,'J')
           @university_entry = University.create(name: university_name)
           university_id = @university_entry.id
        else
        university_id = @university.id
        end

        @qualification = Qualification.create(employee_id: employee_id,degree_type_id: degree_type_id,degree_id: degree_id,
          degree_stream_id: degree_stream_id,marks: marks,year_id: year_id,college: college,university_id: university_id)
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
