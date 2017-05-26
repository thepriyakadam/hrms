class ReportingMasterRembursment < ActiveRecord::Base
  belongs_to :rembursment
  belongs_to :manager
end
