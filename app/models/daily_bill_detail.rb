class DailyBillDetail < ActiveRecord::Base
  belongs_to :travel_request
  belongs_to :travel_expence_type
  has_many :daily_bill_detail_history
  validates :expence_date, presence: true
  validates :e_place, presence: true
  validates :travel_expence, presence: true

end
