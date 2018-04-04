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
end