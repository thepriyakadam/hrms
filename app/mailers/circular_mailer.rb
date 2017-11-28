class CircularMailer < ApplicationMailer

   def send_email(circular)
	  @circular = circular
	  mail(to: @circular.email, subject: 'Email Sent')
	end
end
