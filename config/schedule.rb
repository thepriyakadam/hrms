# every :thursday, :at => '02:20pm' do  
#   rake 'task_namespace:send_mail' , :environment => 'development',   :output => 'log/cron_rake.log'
# end

every :day, :at => '06:51pm' do
  rake 'task_namespace:birthday_mail' , :environment => 'development',   :output => 'log/birthday_mail.log'
  rake 'task_namespace:birthday_invitation_mail' , :environment => 'development',   :output => 'log/birthday_invitation_mail.log'
end