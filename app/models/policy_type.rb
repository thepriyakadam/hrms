class PolicyType < ActiveRecord::Base
	has_many :company_policies

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
        is_active = spreadsheet.cell(i,'E')
        if is_active == "Yes" || is_active == "yes"
          is_active = true
        else
          is_active = false
        end
       
        @policy = PolicyType.find_by(name: name)
        if @policy.nil?
        @policy_type = PolicyType.create(code: code,name: name,description: description,is_active: is_active)     
        else
          @policy.update(code: code,name: name,description: description,is_active: is_active)
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
