class LeavingReason < ActiveRecord::Base
validates :code, presence: true,  uniqueness: { case_sensitive: false }
validates :name, presence: true,  uniqueness: { case_sensitive: false }


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
        is_confirm = spreadsheet.cell(i,'E')
        if is_confirm == "Yes" || is_confirm == "yes"
        	is_confirm = true
        else
        	is_confirm = false
        end

        @leaving = LeavingReason.find_by(name: name)
        if @leaving.nil?
        @leaving_reason = LeavingReason.create(code: code,name: name,description: description,is_confirm: is_confirm)     
        else
          @leaving.update(code: code,name: name,description: description,is_confirm: is_confirm)
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
