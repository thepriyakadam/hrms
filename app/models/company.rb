class Company < ActiveRecord::Base
  belongs_to :group
  belongs_to :company_type
  has_one :member, as: :account
  after_create :create_user_account

  validates :name, :presence => true

 

  validates :registration_no, :presence => true
  validates :pan_card_no, :presence => true
  validates :tax_no, :presence => true 
  validates :address, :presence => true
  validates :pan_card_no, :presence => true
  validates :professional_tax_no, :presence => true
  validates :ceo_name, :presence => true
  validates :web_site, :presence => true
  validates :starting_date, :presence => true
  validates :email, uniqueness: true, :presence => true
  validate  :email_regex
  validates :address, :presence => true, :allow_blank => true
 
  validates :contact_no, :presence => true
   validates :city, :presence => true
    validates :district, :presence => true
    validates :pin_code, :presence => true
    validates :state, :presence => true
   validate :email_regex
   validate :company_name_regex
   validate :city_regex
   validate :state_regex
   validate :company_head_regex
   validate :contact_no_regex

  validates_length_of :pin_code, is:6,message:"Can't allow more than 6 digits"
  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"

  
def company_name_regex
    if name.present? and not name.match(/\A[A-Za-z0-9-_ ]{1,50}\Z/)
      errors.add :name,"First Name allows only Characters"
    end
  end

def contact_no_regex
    if contact_no.present? and not contact_no.match(/^[0-9-]+$/)
      errors.add :contact_no,"Please Enter correct Contact No"
    end
  end 
def email_regex
     if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
       errors.add :email, "This is not a valid email format"
    end
    end 

 # def email_regex
 #    if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
 #      errors.add :email, "This is not a valid email format"
 #    end
 #  end

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

  # def pincode_regex
  #   if pin_code.present? and not pin_code.match(/\A[A-Za-z0-9-_ ]{4,50}\Z/)
  #     errors.add :pin_code,"Pincode allows only Digits"
  #   end
  # end

  def state_regex
    if state.present? and not state.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :state,"State allows only Characters"
    end
  end

  def company_head_regex
    if ceo_name.present? and not ceo_name.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :ceo_name,"Company Head allows only Characters"
    end
  end

  # def contact_no_regex
  #   if contact_no.present? and not contact_no.match(/^[0-9-]+$/)
  #     errors.add :contact_no,"Contact No allows only Digits"
  #   end
  # end


  def create_user_account
    company = Company.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = company
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Company Account created successfully."
      UserPasswordMailer.welcome_email(company,pass).deliver_now
    end
  end
end






