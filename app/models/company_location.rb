class CompanyLocation < ActiveRecord::Base
  protokoll :location_code, :pattern => "COMLOC###"
  belongs_to :company
  has_one :member

  validates :name, :presence => true

  validates :city, :presence => true
  validates :district , :presence => true
 
  validate  :email_regex
  # validate :locat_name_regex
  validate :contact_no_regex
     # validate :city_regex
     # validate :district_regex
  validates :email, uniqueness: true
  validate  :email_regex
  
  
  validates :address, :presence => true
  
def email_regex
     if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
       errors.add :email, "This is not a valid email format"
    end
    end

  #   def locat_name_regex
  #   if name.present? and not name.match(/\A[A-Za-z_ ]{1,30}\Z/)
  #     errors.add :name,"Location Name allows only Characters"
  #   end
  # end

  def contact_no_regex
    if contact_no.present? and not contact_no.match(/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/)
      errors.add :contact_no,"Please Enter correct Contact No"
    end
  end
  
 #  def city_regex
 #    if city.present? and not city.match(/\A[A-Za-z_ ]{1,30}\Z/)
 #      errors.add :city,"City Name allows only Characters"
 #    end
 #  end

 # def district_regex
 #    if district.present? and not district.match(/\A[A-Za-z_ ]{1,30}\Z/)
 #      errors.add :district,"District allows only Characters"
 #    end
 #  end


end
