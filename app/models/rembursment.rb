class Rembursment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
  belongs_to :rembursmentmaster

  has_many :reportingmasterrembursments
end
