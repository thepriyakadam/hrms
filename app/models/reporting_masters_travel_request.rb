class ReportingMastersTravelRequest < ActiveRecord::Base
   
   belongs_to :travel_request
   belongs_to :reporting_master
    
end
