class Thought < ActiveRecord::Base
  validates :date, presence: true, uniqueness: { case_sensitive: false }

	  def self.import(file)
       spreadsheet = open_spreadsheet(file)
       (2..spreadsheet.last_row).each do |i|
        date = spreadsheet.cell(i,'B')
        thought = spreadsheet.cell(i,'C')
        thought_of = spreadsheet.cell(i,'D')

        @thought = Thought.create(date: date,thought: thought,thought_of: thought_of)
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
