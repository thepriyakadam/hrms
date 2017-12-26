class Rembursmentmaster < ActiveRecord::Base
has_many :rembursments


	def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'B')
        name = spreadsheet.cell(i,'C')
        description = spreadsheet.cell(i,'D')
        status = spreadsheet.cell(i,'E')
        if status == "Yes" || status == "yes"
        	status = true
        else
        	status = false
        end
        @reward_type = Rembursmentmaster.create(code: code,name: name,description: description,status: status)     
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
