set :output, "#{path}/log/cron.log"

# every :thursday, :at => '02:20pm' do  
#   rake 'task_namespace:send_mail' , :environment => 'development',   :output => 'log/cron_rake.log'
# end

set :output, "#{path}/log/cron.log"
every :day, :at => '12:05am' do
  rake 'task_namespace:birthday_mail' , :environment => 'development',   :output => 'log/birthday_mail.log'
  # rake 'task_namespace:birthday_invitation_mail' , :environment => 'development',   :output => 'log/birthday_invitation_mail.log'
end

# every :day, :at => '06:28pm' do
#   rake 'task_namespace:pending_request_mail' , :environment => 'development',   :output => 'log/pending_request_mail.log'
#   # rake 'task_namespace:birthday_invitation_mail' , :environment => 'development',   :output => 'log/birthday_invitation_mail.log'
# end

#every :day, :at => '12:30pm' do
# rake 'atte_task:fetch_att'
#end

#every :day, :at => '12:35pm' do
#  rake 'atte_task:calculate'
#end

#every :day, :at => '11:00am' do
#  rake 'atte_task:fetch_att'
#end

# every :day, :at => '11:10am' do
#   runner "DailyAttendance.calculate_attendance(2)"
# end

every :day, :at => '10:30am' do
  rake 'atte_task:fetch_att'
end

# every :day, :at => '07:10pm' do
#   runner "DailyAttendance.calculate_attendance(2)"
# end

#every 1.hours do
 # runner "DailyAttendance.fetch_data"
#end


every 10.minutes do 
   rake 'atte_task:fetch_att'
end

every 7.hours do
   rake 'atte_task:calculate'
end 
