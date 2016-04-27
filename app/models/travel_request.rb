class TravelRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  has_many :daily_bill_details
  has_many :reporting_masters_travel_requests
  has_many :reporting_masters, through: :reporting_masters_travel_requests
end
