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

##################  Transaction Record ####################

every :day, :at => '02:50pm' do
  rake 'atte_task:transaction_att', :environment => 'development',   :output => 'log/cron.log'
end

##################  Fetch Attendance  ####################

every :day, :at => '10:00am' do
  runner "DailyAttendance.fetch_att"
end

every :day, :at => '10:30am' do
  rake 'atte_task:fetch_att'
end

every 2.hours do 
  rake 'atte_task:fetch_att'
end

################ Calculate Attendance ####################

every :day, :at => '10:10am' do
  runner "DailyAttendance.calculate_attendance"
end

every 7.hours do
  rake 'atte_task:calculate'
end

################ Third Att. Uttam  #######################

# every 1.hours + 10.minutes do
#   rake 'atte_task:third_fetch_att'
# end

################# Clear LOG #######################

every 1.hours do 
  rake 'log:clear'
end

