class TravelRequestHistory < ActiveRecord::Base
  belongs_to :travel_request
  belongs_to :reporting_master
  belongs_to :travel_option
  belongs_to :employee
  belongs_to :travel_mode
  belongs_to :company_location
  belongs_to :department
end
