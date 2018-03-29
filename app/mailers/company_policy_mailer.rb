class CompanyPolicyMailer < ApplicationMailer

   def send_email(company_policy)
	  @company_policy = company_policy
	  mail(to: @company_policy.email, subject: 'Email Sent')
	end
end
