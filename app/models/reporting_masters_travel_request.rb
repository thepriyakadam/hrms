class ReportingMastersTravelRequest < ActiveRecord::Base
   
   belongs_to :travel_request
   belongs_to :reporting_master
  

  has_many :subordinates, class_name: 'ReportingMastersTravelRequest',
                          foreign_key: 'daily_bill_id'
  belongs_to :daily_bill, class_name: 'DailyBillDetail'
    
end
