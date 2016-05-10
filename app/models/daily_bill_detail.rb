class DailyBillDetail < ActiveRecord::Base
  belongs_to :travel_request
  validates :expence_date, presence: true
  validates :e_place, presence: true
  validates :travel_expence, presence: true

end
