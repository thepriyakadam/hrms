class Company < ActiveRecord::Base
  protokoll :company_code, :pattern => "COM###"
  belongs_to :group
  belongs_to :company_type
  has_many :member

  validates :name, :presence => true
  validates :registration_no, :presence => true
  validates :tax_no, :presence => true
  validates :address, :presence => true
  validates :pan_card_no, :presence => true
  validates :professional_tax_no, :presence => true
  #validates :ceo_name, :presence => true
  validates :web_site, :presence => true
  validates :starting_date, :presence => true
  #validates :email, :presence => true
 
  #validates :contact_no, :presence => true
  validates :city, :presence => true
  validates :district, :presence => true, on: :create
  validates :pin_code, :presence => true
  validates :state, :presence => true, on: :create
  #validate :email_regex
  validate :company_name_regex
  validate :pan_no_regex
  validate :city_regex
  validate :district_regex
  validate :state_regex
  validate :contact_no_regex
  validate :company_head_regex
  validate :website_regex
  

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
  

  def company_head_regex
    if ceo_name.present? and not ceo_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :ceo_name,"Company Head allows only Characters"
    end
  end

def website_regex
    if web_site.present? and not web_site.match(/^(www\.)?[a-zA-Z\-]{3,}(\.(com|net|org|in))?$/)
      errors.add :web_site,"Please Enter Correct Website Format"
    end
  end

  def pan_no_regex
    if pan_card_no.present? and not pan_card_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_card_no,"Please specify Correct Pan Card Number"
    end
   end

  def email_regex
    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
       errors.add :email, "This is not a valid email format"
    end
  end 

 def city_regex
    if city.present? and not city.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :city,"City Name allows only Characters"
    end
  end

 def district_regex
    if district.present? and not district.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :district,"District allows only Characters"
    end
  end



  def state_regex
    if state.present? and not state.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :state,"State allows only Characters"
    end
  end
end