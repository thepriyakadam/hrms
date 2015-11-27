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
  validate :address_regex
  validates :contact_no, :presence => true
   validates :city, :presence => true
    validates :district, :presence => true
    validates :pin_code, :presence => true
    validates :state, :presence => true
   validate :email_regex


  validates_length_of :name, is: 30,  message:"Name allows upto 30 alphabets"
  validates_length_of :registration_no, is: 30,  message:"Registration allows upto 30 alphabets"
  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
  validates_length_of :tax_no, is: 5,  message:"Enter the Valid Tax number"
  validates_length_of :address, is: 100,  message:"Enter the Address"
  validates_length_of :pan_card_no, is: 10,  message:"Enter the Pancard Details max 10 char"
  validates_length_of :starting_date, is:8, message:"Date can't be blank"
  validates_length_of :professional_tax_no, is: 10,  message:"Enter the Valid Professional Tax number"
  validates_length_of :city, is: 30,  message:"City Details allows max 30 characters"
  validates_length_of :district, is: 30,  message:"District Details allows max 30 characters"
  validates_length_of :pin_code, is: 6,  message:"Pincode Details allows max 9 digits"
  validates_length_of :state, is: 50,  message:"State Details allows max 50 characters"
  validates_length_of :web_site, is: 30,  message:"Website Name allows max 30 characters"
  validates_length_of :ceo_name, is: 30,  message:"CEO Name allows max 30 characters"
  validates_length_of :email, is: 50,  message:"Email ID allows max 50 characters"

  def address_regex
    if address.present? and not address.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :address,"Please Enter The Correct Address"
    end
  end

# def email_regex
#    if email.present? and not email.match(/^(www\.)?[a-zA-Z0-9\-]{3,}(\.(com|net|org))?$/\Z/)
#        errors.add :email, "This is not a valid email format"
#      end
#    end


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






