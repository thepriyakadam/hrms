class TransactionRecord < ActiveRecord::Base
  belongs_to :compliance_type

  def self.email_to_all
  	@date = Time.now.to_date + 5
  	@transactions = TransactionRecord.where(reminder_date: @date.to_date)
  	@transactions.each do |t|
  		TransactionRecordMailer.send_email(t).deliver_now
  	end
  	puts '------cross do loop'
  end
end
