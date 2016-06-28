class SlipInformation < ActiveRecord::Base
  belongs_to :salaryslip
  belongs_to :cost_center
  belongs_to :department
end
