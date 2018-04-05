class GpsInformation < ActiveRecord::Base
  belongs_to :employee
  validates :place, presence: true

  geocoded_by :place
  after_validation :geocode
end
