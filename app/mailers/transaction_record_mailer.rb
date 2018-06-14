class TransactionRecordMailer < ApplicationMailer
	def send_email(transaction_record)
		@transaction_record = transaction_record
		if @transaction_record.email_1 == ""
		else
    	mail(to: @transaction_record.email_1,subject: 'Transaction Record')
    end
	end
end
