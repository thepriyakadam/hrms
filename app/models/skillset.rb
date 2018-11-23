class Skillset < ActiveRecord::Base
  belongs_to :employee
   validates :name, presence: true, uniqueness: true
  # validates :skill_level, presence: true
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |skillset|
        csv << skillset.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
  spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
      manual_employee_code = spreadsheet.cell(i,'B').to_i
      if manual_employee_code == 0
         manual_employee_code = spreadsheet.cell(i,'B')
         @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B'))
      else
         manual_employee_code = spreadsheet.cell(i,'B').to_i
         @employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
      end

      #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'B').to_i)
        if @employee == nil
        else
          employee_id = @employee.id
          name = spreadsheet.cell(i,'C')
          skill_level = spreadsheet.cell(i,'D')

          @skillset = Skillset.where(employee_id: employee_id,name: name).take
          if @skillset.nil?
            @skillset = Skillset.create(employee_id: employee_id,name: name,skill_level: skill_level)
          else
            @skillset.update(employee_id: employee_id,name: name,skill_level: skill_level)
          end
        end
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
