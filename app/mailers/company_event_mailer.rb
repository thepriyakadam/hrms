class CompanyEventMailer < ApplicationMailer

	def send_email(company_event)
	  @company_event = company_event
	  mail(to: @company_event.email, subject: 'Email Sent')
	end
end