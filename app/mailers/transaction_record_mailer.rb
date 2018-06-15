class TransactionRecordMailer < ApplicationMailer
	def send_email(transaction_record)
		@transaction_record = transaction_record
		
		if @transaction_record.email_1.nil?
    	puts '--------------email nil'
		else
    	mail(to: transaction_record.email_1,subject: 'Transaction Record')
    	puts '--------------mail'
    end
	end
end
