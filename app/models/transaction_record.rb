class TransactionRecord < ActiveRecord::Base
  belongs_to :compliance_type
  validates :compliance_type_id, presence: true
  validates :transaction_type, presence: true
  validates :email_1, presence: true

  def self.email_to_all
  	@date = Time.now.to_date + 5
  	@transactions = TransactionRecord.where(reminder_date: @date.to_date)
  	@transactions.each do |t|
  		TransactionRecordMailer.send_email(t).deliver_now
  	end
  	puts "------cross do loop #{Time.now}"
  end
end
