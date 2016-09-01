class TravelMode < ActiveRecord::Base
  has_many :travel_options
  has_many :travel_modes
  has_many :travel_request_histories
  validates :code, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
