class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  has_one :member, as: :account
  after_create :create_user_account

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :contact_no, :presence => true
  validates :adhar_no, :presence => true
  validates :pan_no, :presence => true
  validates_length_of :pin_code, is: 6,  message:"Please Enter 12 digit"
  validates_length_of :adhar_no, is: 12, message:"Please Enter 12 digit"
   validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
  validates :email, uniqueness: true, presence: true
  validates :date_of_birth, :presence => true
  validate  :email_regex


  validates :permanent_address, :presence => true
  validate :address_regex

  


  def address_regex
    if permanent_address.present? and not permanent_address.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :permanent_address,"Please Enter The Correct Address"
    end
  end

  def email_regex
    if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
      errors.add :email, "This is not a valid email format"
    end
   end


  def create_user_account
    employee = Employee.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = employee
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Employee Account created successfully."
      #UserPasswordMailer.welcome_email(employee,pass).deliver_now
    end
  end
end
