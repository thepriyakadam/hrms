class DailyBillDetail < ActiveRecord::Base
  belongs_to :travel_request
  belongs_to :travel_expence_type
  belongs_to :reporting_masters
  has_many :daily_bill_detail_histories
  has_many :reportiong_masters_travel_requests
  validates :expence_date, presence: true
  validates :e_place, presence: true
  validates :travel_expence, presence: true

end
