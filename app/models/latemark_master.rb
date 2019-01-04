class LatemarkMaster < ActiveRecord::Base
  belongs_to :shift_time

  #validates :id, uniqueness: { scope: [:shift_time_id] }

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

	def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|    
      code = spreadsheet.cell(i,'B')
      latemark_date = spreadsheet.cell(i,'C')
      count = spreadsheet.cell(i,'D')
      if count == nil
        count = 0
      else
        count = spreadsheet.cell(i,'D')
      end
     	amount = spreadsheet.cell(i,'E')
      if amount == nil
        amount = 0
      else
        amount = spreadsheet.cell(i,'E')
      end
      employee = Employee.find_by(manual_employee_code: code.to_i)
      if employee.nil?
      else
        LatemarkDeduction.create(employee_id: employee.id,latemark_day: latemark_date,
            latemark_count: count.to_i,latemark_amount: amount,comment: "Manually",paid: false)
      end
    end#do
  end

end
