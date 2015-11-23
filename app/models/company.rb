class Company < ActiveRecord::Base
  belongs_to :group
  belongs_to :company_type
  has_one :member, as: :account
  after_create :create_user_account

  validates :name, :presence => true
  validates :registration_no, :presence => true
  validates :pan_card_no, :presence => true
  validates :tax_no, :presence => true
  validates :pan_card_no, :presence => true
  validates :professional_tax_no, :presence => true
  validates :ceo_name, :presence => true 
  validates :web_site, :presence => true
  validates_length_of :pin_code, is: 6,  message:"Please Enter 12 digit"
  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
  validates :starting_date, :presence => true
  validates :email, uniqueness: true, presence: true
  validate  :email_regex
  validates :address, :presence => true, :allow_blank => true
  validate :address_regex

  def address_regex
    if address.present? and not address.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :address,"Please Enter The Correct Address"
    end
  end

 def email_regex
    if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
      errors.add :email, "This is not a valid email format"
    end
  end

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






