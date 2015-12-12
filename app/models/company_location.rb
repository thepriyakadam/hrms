class CompanyLocation < ActiveRecord::Base
  protokoll :location_code, :pattern => "COMLOC###"
  belongs_to :company
  belongs_to :country
  belongs_to :state
  belongs_to :district
  has_many :member

  # validates :name, :presence => true


  # validates :city, :presence => true
  # validates :district , :presence => true

  # validate :contact_no_regex

  
  # validates :address, :presence => true
  


  # def contact_no_regex
  #   if contact_no.present? and not contact_no.match(/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/)
  #     errors.add :contact_no,"Please Enter correct Contact No"
  #   end
  # end
 
end
