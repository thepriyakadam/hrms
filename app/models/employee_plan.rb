class EmployeePlan < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode
end
