class DailyBillDetailHistory < ActiveRecord::Base
  belongs_to :daily_bill_detail
  belongs_to :travel_expence_type
end
