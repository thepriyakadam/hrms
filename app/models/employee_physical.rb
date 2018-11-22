class EmployeePhysical < ActiveRecord::Base
  belongs_to :employee

  validates :height, presence: true
  validates :weight, presence: true
  validates :size, presence: true
  validates :trouser_size, presence: true

   def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee_physical|
        csv << employee_physical.attributes.values_at(*column_names)
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
        height = spreadsheet.cell(i,'C')
        weight = spreadsheet.cell(i,'D')
        size = spreadsheet.cell(i,'E')
        trouser_size = spreadsheet.cell(i,'F')

        @employee_physical = EmployeePhysical.where(employee_id: employee_id).take
          if @employee_physical.nil?
            @employee_physical = EmployeePhysical.create(employee_id: employee_id,height: height,weight: weight,size: size,trouser_size: trouser_size)
          else
            @employee_physical.update(employee_id: employee_id,height: height,weight: weight,size: size,trouser_size: trouser_size)
          end
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
