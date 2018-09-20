class TransactionRecord < ActiveRecord::Base
  belongs_to :compliance_type
  validates :compliance_type_id, presence: true
  #validates :transaction_type, presence: true
  validates :email_1, presence: true
  validates :reminder_to, presence: true
  validates :reminder_Date, presence: true

  def self.email_to_all
    @pending_records = TransactionRecord.where(status: "Pending")
    @pending_records.each do |pt|
      #@day = Time.now.to_date + 1
    	#@previous = Time.now.to_date + pt.previous_days.to_f
      #@after = Time.now.to_date - pt.after_days.to_f
      #@today = Time.now.to_date
    	#@transactions = TransactionRecord.where("reminder_date = ? OR reminder_date = ? OR reminder_date = ?", @previous.to_date ,@after.to_date, @today.to_date)
    	#@transactions = TransactionRecord.where(reminder_date: @day.to_date)
      @transactions = pt.reminder_Date.to_date..pt.reminder_to.to_date
      @transactions.each do |t|
        if Date.today == t
    		  TransactionRecordMailer.send_email(pt).deliver_now
        end#Date.today
    	end#@transactions.each do |t|
    	puts "------cross do loop #{Time.now}"
    end#@pending_records.each do |pt|
  end

end
