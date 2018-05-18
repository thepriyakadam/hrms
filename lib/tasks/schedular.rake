require 'rake'
namespace :atte_task do
  desc 'attendance data'
  task :fetch_att => :environment do
    DailyAttendance.fetch_data(3)
  end

  desc 'calculate attendance'
  task :calculate => :environment do
    DailyAttendance.calculate_attendance(2)
  end

  desc 'attendance data'
  task :third_fetch_att => :environment do
    DailyAttendance.third_fetch_data(3)
  end
end
