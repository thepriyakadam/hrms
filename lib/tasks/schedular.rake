require 'rake'
namespace :atte_task do
  desc 'attendance data'
  task :fetch_att => :environment do
    DailyAttendance.fetch_data(2)
  end

  desc 'calculate attendance'
  task :calculate => :environment do
    DailyAttendance.calculate_attendance(2)
  end

  desc 'aurangabad attendance data'
  task :third_fetch_data => :environment do
    DailyAttendance.third_fetch_data(2)
  end

  desc 'clear logs'
  task :clear_log => :environment do
    DailyAttendance.clear_logs
  end
end