class TravelExpenceType < ActiveRecord::Base
  has_many :daily_bill_details
  validates :code, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
