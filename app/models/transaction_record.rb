class TransactionRecord < ActiveRecord::Base
  belongs_to :compliance_type
  validates :compliance_type_id, presence: true
  validates :transaction_type, presence: true
  validates :email_1, presence: true

  def self.email_to_all
    @pending_records = TransactionRecord.where(status: "Pending")
    #@pending_records.each do |pt|
      @day = Time.now.to_date + 1
    	# @previous = Time.now.to_date + pt.previous_days.to_f
     #  @after = Time.now.to_date - pt.after_days.to_f
     #  @today = Time.now.to_date

    	#@transactions = TransactionRecord.where("reminder_date = ? OR reminder_date = ? OR reminder_date = ?", @previous.to_date ,@after.to_date, @today.to_date)
    	     @transactions = TransactionRecord.where(reminder_date: @day.to_date)
      @transactions.each do |t|
    		TransactionRecordMailer.send_email(t).deliver_now
    	end#@transactions.each do |t|
    	puts "------cross do loop #{Time.now}"
    #end#@pending_records.each do |pt|
  end

end
