# desc 'send digest email'
# task send_digest_email: :environment do
#   # ... set options if any
#   # @interview_schedule = InterviewSchedule.where(id: 3).take
#    InterviewScheduleMailer.sample_email(@interview_schedule).deliver_now
# end

require 'rake'
namespace :task_namespace do
  desc 'task description'
  task :send_mail => :environment do
    # call Listing method to send mail
    InterviewScheduleMailer.sample_email.deliver!
    # rake db:migrate
  end

   task :birthday_mail => :environment do
    # call Listing method to send mail
    EmployeeMailer.birthday_email.deliver!
    # rake db:migrate
  end

  task :birthday_invitation_mail => :environment do
    # call Listing method to send mail
    EmployeeMailer.birthday_invitation.deliver!
    # rake db:migrate
  end
end