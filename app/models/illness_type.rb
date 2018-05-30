class IllnessType < ActiveRecord::Base
	has_many :employee_nominations

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
        
        @illness = IllnessType.find_by(name: name)
        if @illness.nil?
        @illness_type = IllnessType.create(code: code,name: name,description: description)     
        else @illness.update(code: code,name: name,description: description)
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
