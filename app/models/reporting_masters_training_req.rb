class ReportingMastersTrainingReq < ActiveRecord::Base
  belongs_to :training_request
  belongs_to :reporting_master
end
