class DailyAttendance < ActiveRecord::Base

  validates :employee_code, uniqueness: { scope: [:date, :time, :controller] }

  #validates_uniqueness_of :employee_code, {scope: [:time]}
  #validates_uniqueness_of :employee_code, :scope => :time
  #validates_uniqueness_of :employee_code, scope: [:date, :time]

  def self.import(file)
	spreadsheet = open_spreadsheet(file)
   (2..spreadsheet.last_row).each do |i|

        sr_no = spreadsheet.cell(i,'A')
        date = spreadsheet.cell(i,'B')
        time = spreadsheet.cell(i,'C')
        #@employee = Employee.find_by_manual_employee_code(spreadsheet.cell(i,'D').to_i)
        employee_code = spreadsheet.cell(i,'D') #@employee.id
        card_no = spreadsheet.cell(i,'E')
        employee_name = spreadsheet.cell(i,'F')
        controller = spreadsheet.cell(i,'G')
        reader_name = spreadsheet.cell(i,'H')
        access_status = spreadsheet.cell(i,'I')
        @daily_attendace = DailyAttendance.create(sr_no: sr_no,date: date,time: time,employee_code: employee_code,card_no: card_no,employee_name: employee_name,controller: controller,reader_name: reader_name,access_status: access_status) 
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  class << self
    def fetch_data
      @data = CheckInOut.all
      @data.each do |d|
        user_check_in_time = d.CHECKTIME
        if user_check_in_time.to_date == Date.yesterday
          date = user_check_in_time
          time = user_check_in_time
          user_id = d.USERID
          user_check_in_time_abc = d.CHECKTIME.to_date
          user_check_type = d.CHECKTYPE 
          user_verify_code = d.VERIFYCODE 
          user_sensor_id = d.SENSORID
          user_memo_info = d.Memoinfo 
          user_wok_code = d.WorkCode
          user_sn = d.sn
          user_ext_fmt = d.UserExtFmt
          user_log_id = d.LOGID
          user_machine_id = d.MachineId
          user = DailyAttendance.where(date: user_check_in_time_abc).present?
          if user == true
            puts 'all ready updated'
          else
            DailyAttendance.create(date: date, time: time, employee_code: user_id)
          end
        else

        end
      end
    end
  end
end