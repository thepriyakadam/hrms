class CompanyLocation < ActiveRecord::Base
  protokoll :location_code, :pattern => "COMLOC###"
  belongs_to :company
  belongs_to :country
  belongs_to :state
  belongs_to :district
  has_many :member

  validates :manual_company_location_code, :presence => true, uniqueness: { case_sensitive: false }
  validates :country_id, :presence => true
  validates :state_id, :presence => true
  validates :district_id, :presence => true
 
end
