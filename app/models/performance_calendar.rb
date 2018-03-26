class PerformanceCalendar < ActiveRecord::Base
  belongs_to :period
  belongs_to :performance_activity

  validates :period_id, presence: true
  validates :performance_activity_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


    def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (2..spreadsheet.last_row).each do |i|

        @period = Period.find_by_name(spreadsheet.cell(i,'B'))
        if @period == nil
          period_name = spreadsheet.cell(i,'B')
           @period_entry = Period.create(name: period_name)
           period_id = @period_entry.id
        else
        period_id = @period.id
        end
        @performance_activity = PerformanceActivity.find_by_name(spreadsheet.cell(i,'C'))
        if @performance_activity == nil
          performance_activity_name = spreadsheet.cell(i,'C')
           @performance_activity_entry = PerformanceActivity.create(name: performance_activity_name)
           performance_activity_id = @performance_activity_entry.id
        else
        performance_activity_id = @performance_activity.id
        end
        start_date = spreadsheet.cell(i,'D')
        end_date = spreadsheet.cell(i,'E')
        
        @employee = PerformanceCalendar.find_by_name(period_id: period_id)
        if @employee.nil?
        @performance = PerformanceCalendar.create(period_id: period_id,performance_activity_id: performance_activity_id,start_date: start_date,end_date: end_date)
       else
        @employee.update(period_id: period_id,performance_activity_id: performance_activity_id,start_date: start_date,end_date: end_date)
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