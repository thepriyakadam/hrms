class InterviewDecision < ActiveRecord::Base
 validates :code, presence: true
  validates :name, presence: true


    def self.import_evaluation(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'A')
        name = spreadsheet.cell(i,'B').to_i
        description = spreadsheet.cell(i,'C')

        @interview_decision = InterviewDecision.create(code: code,name: name,description: description)     
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
