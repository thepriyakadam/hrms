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
  end#def


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

 def self.import_shift_employee(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|
      
      shift = spreadsheet.cell(i,'B')
      shift_name = spreadsheet.cell(i,'C')
      employee_id = spreadsheet.cell(i,'D')
      from = spreadsheet.cell(i,'E')
      to = spreadsheet.cell(i,'F')
      status = spreadsheet.cell(i,'G')

      if status == "Active" || status == "active"
        status = true
      else
        status = false
      end

      if employee_id == 0
        employee_id = spreadsheet.cell(i,'D')
      else
        employee_id = spreadsheet.cell(i,'D').to_i
      end

      if shift == nil || shift_name == nil || employee_id == nil || from == nil || to == nil
      else
        @employee_id = employee_id
        employee = Employee.find_by(manual_employee_code: employee_id)
        if employee.nil?
        else
          shift_time = ShiftTime.where(shift: shift,name: shift_name).take
          if shift_time.nil?    
          else
            @shift_schedule = ShiftSchedule.where(shift_time_id: shift_time.id,from: from.to_date,to: to.to_date,status: true).take
            if @shift_schedule.nil?
              @shift_schedule = ShiftSchedule.create(shift_time_id: shift_time.id,from: from.to_date,to: to.to_date,status: status)     
            else
              @shift_schedule.update(shift_time_id: shift_time.id,from: from.to_date,to: to.to_date,status: status)
            end#@shift_schedule.nil?
          
            for i in @shift_schedule.from.to_date..@shift_schedule.to.to_date
              @shift_employee = ShiftEmployee.where(shift_schedule_id: @shift_schedule.id,date: i,employee_id: employee.id).take
              if @shift_employee.nil?
                ShiftEmployee.create(shift_schedule_id: @shift_schedule.id,employee_id: employee.id,date: i,created_by_id: nil,shift_time_id: @shift_schedule.shift_time_id,status: true)
              else
                @shift_employee.update(shift_schedule_id: @shift_schedule.id,employee_id: employee.id,date: i,created_by_id: nil,shift_time_id: @shift_schedule.shift_time_id,status: true)
              end
            end#for i 
          end#shift_time.nil?
        end#employee.nill?
      end#shift == nil || shift_time_name == nil 
    end#do
  end#def


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
