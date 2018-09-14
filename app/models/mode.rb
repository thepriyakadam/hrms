class Mode < ActiveRecord::Base
  belongs_to :expence_opestion
  has_many :daily_bill_details
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
        employee_grade = spreadsheet.cell(i,'A')
        @employee_grade = EmployeeGrade.find_by(name: employee_grade)
        expence_opestion = spreadsheet.cell(i,'B')
        @expence_opestion = ExpenceOpestion.find_by(name: expence_opestion,employee_grade_id: @employee_grade.id)

        if @expence_opestion.nil?
        else
          expence_opestion_id = @expence_opestion.id
          code = spreadsheet.cell(i,'C')
          if code == 0
            code = spreadsheet.cell(i,'C')
          else
            code = spreadsheet.cell(i,'C')
          end
          name_mode = spreadsheet.cell(i,'D')
          description = spreadsheet.cell(i,'E')
         	status = spreadsheet.cell(i,'F')
           if status == "Yes" || status == "yes" || status == "Active" || status == "active" 
             status = true
            else
            status = false
           end

         	@mode = Mode.find_by(name: name_mode,expence_opestion_id: @expence_opestion.id)
          if @mode == nil
          	@expence_opestions_new = Mode.create(expence_opestion_id: expence_opestion_id, code: code,name: name_mode, description: description, status: status)
          else 
          	@mode.update(expence_opestion_id: expence_opestion_id, code: code,name: name_mode, description: description, status: status)
        	end
        end#@expence_opestion.nil?
    end#do
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
