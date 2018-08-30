class EmailReminder < ActiveRecord::Base
  belongs_to :task
  validates :task_id, presence: true
  validates :frequency, presence: true
  validates :reminder_to, presence: true
  validates :reminder_from, presence: true
  validates :task_date, presence: true
  validates :email_to, presence: true

  def self.reminder_mail
  	@email_reminders = EmailReminder.where(status: true)
  	@email_reminders.each do |e|
  		task_date = e.task_date
  		previous_date = task_date.to_date - e.reminder_from.to_f
  		after_date = task_date.to_date + e.reminder_to.to_f
  		#@time_period = previous_date..after_date
  		if e.frequency == "Monthly"
  			@time_period = previous_date.to_date..after_date.to_date
  			@time_period.each do |t|
  				if Date.today.strftime("%d") == t.strftime("%d")
    		  	EmailReminderMailer.send_reminder_mail(e).deliver_now
        	end#if
  			end#do
  		elsif e.frequency == "Yearly"
  			@time_period = previous_date.to_date..after_date.to_date
  			@time_period.each do |t|
  				if Date.today.strftime("%d/%m") == t.strftime("%d/%m")
  					EmailReminderMailer.send_reminder_mail(e).deliver_now
  				end#if
  			end#do
  		else
  			@time_period = previous_date..after_date
  			@time_period.each do |t|
  				if Date.today == t
  					EmailReminderMailer.send_reminder_mail(e).deliver_now
  				end
  			end#do
  		end#e.frequency
  	end#do
  end

end
