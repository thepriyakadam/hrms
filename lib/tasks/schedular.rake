require 'rake'
namespace :atte_task do
  desc 'attendance data'
  task :fetch_att => :environment do
    DailyAttendance.fetch_data
  end

  desc 'calculate attendance'
  task :calculate => :environment do
    DailyAttendance.calculate_attendance
  end
end