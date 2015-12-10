class CompanyLocation < ActiveRecord::Base
  protokoll :location_code, :pattern => "COMLOC###"
  belongs_to :company
  has_many :member

  validates :name, :presence => true

  validates :city, :presence => true
  #validates :district , :presence => true
 
  validate  :email_regex
  validate :contact_no_regex
   
  validates :email, uniqueness: true
  validate  :email_regex
  
  
  validates :address, :presence => true
  
def email_regex
     if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|in|))?$/)
       errors.add :email, "This is not a valid email format"
    end
    end

  def contact_no_regex
    if contact_no.present? and not contact_no.match(/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/)
      errors.add :contact_no,"Please Enter correct Contact No"
    end
  end
 
end
