class TravelRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :reporting_manager
end
