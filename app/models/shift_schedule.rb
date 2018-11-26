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

end
