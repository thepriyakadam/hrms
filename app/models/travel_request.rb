class TravelRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  has_many :daily_bill_details
end
