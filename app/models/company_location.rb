class CompanyLocation < ActiveRecord::Base
  belongs_to :company
  has_one :member, as: :account
  after_create :create_user_account


  validates :name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :district , :presence => true
    validates :contact_no , :presence => true
     validates :pin_code, :presence => true
    
  # validates_length_of :name, is: 30,  message:"Name allows upto 30 alphabets"
  # validates_length_of :address, is:100, message:"Enter the Address upto 100 char max"
  # validates_length_of :city, is: 6,  message:"Cant exceed more than 50 char"
  # validates_length_of :district, is:30, message:"Cant exceed more than 100 char"
  # validates_length_of :contact_no,within: 10..13,  message:"Enter the Correct contact number"
  # validates_length_of :pin_code, is:6,message:"Please Enter Valid Pincode Details upto 6 digit max"
  # validates_length_of :email, is:30,message:"Email address can't exceed max limit"
  
  validates :email, uniqueness: true, :presence => true
  validate  :email_regex
  
  validates :address, :presence => true
  # validate :address_regex

  # def address_regex
  #   if address.present? and not address.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
  #     errors.add :address,"Please Enter The Correct Address"
  #   end
  # end

  # def email_regex
  #   if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
  #     errors.add :email, "This is not a valid email format"
  #   end
  #  end
def email_regex
     if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
       errors.add :email, "This is not a valid email format"
    end
    end

  def create_user_account
    company_location = CompanyLocation.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = company_location
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Company Location Account created successfully."
      #UserPasswordMailer.welcome_email(company_location,pass).deliver_now
    end
    p user.errors
  end
end
