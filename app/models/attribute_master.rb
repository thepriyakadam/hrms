class AttributeMaster < ActiveRecord::Base
	has_many :goal_ratings
	belongs_to :department
	validates :code, presence:true ,uniqueness:{case_sensitive:false}
	validates :name,presence:true, uniqueness:{case_sensitive:false}


    def self.import_attribute(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'A')
        name = spreadsheet.cell(i,'B')
        definition = spreadsheet.cell(i,'C')
        attribute_weightage = spreadsheet.cell(i,'D')
        if attribute_weightage == "Yes" || attribute_weightage == "yes"
        	attribute_weightage = true
        else
        	attribute_weightage = false
        end
        from = spreadsheet.cell(i,'E')
        to = spreadsheet.cell(i,'F')
        status = spreadsheet.cell(i,'G')
        if status == "Yes" || status == "yes"
        	status = true
        else
        	status = false
        end
        @degree = AttributeMaster.create(code: code,name: name,definition: definition,attribute_weightage: attribute_weightage,from: from,to: to,status: status)     
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
