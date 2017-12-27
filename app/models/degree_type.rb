class DegreeType < ActiveRecord::Base
  has_many :qualifications

  validates :name, presence: true, uniqueness: { case_sensitive: false }

    def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'B').to_i
        if code == 0
           code = spreadsheet.cell(i,'B')
         else
          code = spreadsheet.cell(i,'B').to_i
        end
        name = spreadsheet.cell(i,'C')
        description = spreadsheet.cell(i,'D')
       
        @employee = DegreeType.find_by(name: name)
        if @employee.nil?
        @degree = DegreeType.create(code: code,name: name,description: description)     
        else
          @employee.update(code: code,name: name,description: description)
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
