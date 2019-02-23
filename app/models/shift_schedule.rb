class ShiftSchedule < ActiveRecord::Base
  belongs_to :shift_time
  has_many :shift_employees
  #validates :shift_time_id, uniqueness: { scope: [:from,:to] }

  def self.import(file)
   	spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|

      shift = spreadsheet.cell(i,'B')
      shift_time_name = spreadsheet.cell(i,'C')
      from = spreadsheet.cell(i,'D')
      to = spreadsheet.cell(i,'E')
      status = spreadsheet.cell(i,'F')

      if status == "Active" || status == "active"
      	status = true
      else
      	status = false
      end

      if shift == nil || shift_time_name == nil || from == nil || to == nil
      else


      	shift_time = ShiftTime.where(shift: shift,name: shift_time_name).take
        if shift_time.nil?
        else
          @shift_schedule = ShiftSchedule.find_by(shift_time_id: shift_time.id)
          if @shift_schedule.nil?
            @shift_schedule = ShiftSchedule.create(shift_time_id: shift_time.id,from: from.to_date,to: to.to_date,status: status)
          else
            @shift_schedule.update(shift_time_id: shift_time.id,from: from.to_date,to: to.to_date,status: status)
          end#@shift_schedule.nil?
        end#shift_time.nil?
      end#shift == nil || shift_time_name == nil
  	end#do
  end

  def self.import_shift_employee(file)
    begin
      default_shift_employee_ids = []
      employee_ids = []
      monday, tuesday, wednesday, thursday, friday, saturday = nil
      spreadsheet = open_spreadsheet(file)
      (1..spreadsheet.last_row).each do |row|
        if row == 1
          monday = Date.parse(spreadsheet.cell(row, 'D').to_s)
          tuesday = Date.parse(spreadsheet.cell(row, 'E').to_s)
          wednesday = Date.parse(spreadsheet.cell(row, 'F').to_s)
          thursday = Date.parse(spreadsheet.cell(row, 'G').to_s)
          friday = Date.parse(spreadsheet.cell(row, 'H').to_s)
          saturday = Date.parse(spreadsheet.cell(row, 'I').to_s)
        else
          employee_id = spreadsheet.cell(row, 'B').to_i
          employee = Employee.find_by_manual_employee_code(employee_id)
          mon_shift_id = spreadsheet.cell(row, 'D').to_i
          tue_shift_id = spreadsheet.cell(row, 'E').to_i
          wed_shift_id = spreadsheet.cell(row, 'F').to_i
          thu_shift_id = spreadsheet.cell(row, 'G').to_i
          fri_shift_id = spreadsheet.cell(row, 'H').to_i
          sat_shift_id = spreadsheet.cell(row, 'I').to_i

          unless employee.nil?
            employee_ids << employee.id
            if ShiftSchuduleExcel.where(employee_id:employee.id, attendance_date: monday).take.nil?
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: monday, shift_time_id: shift_mapping(mon_shift_id))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: tuesday, shift_time_id: shift_mapping(tue_shift_id))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: wednesday, shift_time_id: shift_mapping(wed_shift_id))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: thursday, shift_time_id: shift_mapping(thu_shift_id))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: friday, shift_time_id: shift_mapping(fri_shift_id))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: saturday, shift_time_id: shift_mapping(sat_shift_id))
            else
              raise "Shift already schedule for the employee #{employee.manual_employee_code}"
            end
          end
          default_shift_employees = Employee.where.not(id: employee_ids)
          default_shift_employees.each do |employee|
            if ShiftSchuduleExcel.where(employee_id:employee.id, attendance_date: monday).take.nil?
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: monday, shift_time_id: shift_mapping(4))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: tuesday, shift_time_id: shift_mapping(4))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: wednesday, shift_time_id: shift_mapping(4))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: thursday, shift_time_id: shift_mapping(4))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: friday, shift_time_id: shift_mapping(4))
              ShiftSchuduleExcel.create(employee_id:employee.id, attendance_date: saturday, shift_time_id: shift_mapping(4))
            end
          end
        end
      end

    rescue Exception => e
      puts e
    end
  end

  def self.shift_mapping old_id
    mapping = {"1" => 107, "4" => 106, "24" => 108, "3" => 109}
    mapping[old_id.to_s]
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
