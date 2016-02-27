class Company < ActiveRecord::Base
  protokoll :company_code, :pattern => "COM###"
  belongs_to :group
  belongs_to :company_type
  belongs_to :district
  belongs_to :state
  belongs_to :country
  has_many :member
  has_many :company_locations,:dependent => :destroy

  validates :manual_company_code, :presence => true, uniqueness: { case_sensitive: false }
  validates :name, :presence => true
  validates :registration_no, :presence => true
  validates :address, :presence => true
  validates :web_site, :presence => true
  validates :country_id, :presence => true
  validates :state_id, :presence => true
  validates :district_id, :presence => true
  validates :city, :presence => true
  validates :pin_code, :presence => true
  validates :name, uniqueness: { scope: [:company_type_id]}
  validate :pan_no_regex
  validate :contact_no_regex

  

 def company_name_regex
    if name.present? and not name.match(/\A[A-Za-z0-9&@_ ]{1,30}\Z/)
      errors.add :name,"Company Name allows only Characters"
    end
  end

  
 def contact_no_regex
    if contact_no.present? and not contact_no.match(/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/)
      errors.add :contact_no,"Please Enter correct Contact No"
    end
  end
  
  def pan_no_regex
    if pan_card_no.present? and not pan_card_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_card_no,"Please specify Correct Pan Card Number"
    end
   end
end