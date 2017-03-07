class TravelRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_master
  belongs_to :travel_option
  belongs_to :travel_mode
  has_many :daily_bill_details
  has_many :reporting_masters_travel_requests
  has_many :reporting_masters, through: :reporting_masters_travel_requests
  validates :tour_purpose, presence: true
  validates :place, presence: true
  
  validates :traveling_date, presence: true
end
