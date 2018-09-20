class EmailReminderMailer < ApplicationMailer
	def send_reminder_mail(email_reminder)
		@email_reminder = email_reminder
		
		if @email_reminder.email_to.nil?
    	puts '--------email nil'
		else
    	mail(to: @email_reminder.email_to,cc: @email_reminder.email_cc,bcc: @email_reminder.email_bcc,subject: 'Task Reminder')
    	puts '--------mail sent'
    end
	end
end
