class TravelMode < ActiveRecord::Base
  has_many :travel_options
  has_many :travel_modes
  validates :code, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
