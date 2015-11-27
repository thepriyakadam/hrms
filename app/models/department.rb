class Department < ActiveRecord::Base
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_one :member, as: :account
  after_create :create_user_account


  validates :name, :presence => true
  validates :contact_no, :presence => true
  validates :head_of_department , :presence => true
  validates :manager, :presence => true
  validates :hr, :presence => true
  validates :pin_code, :presence => true
  validates :address, :presence => true
  # validate :name_regex
  validate :head_of_department_regex
  validate :manager_regex
  validate :hr_regex

  # validates_length_of :name, is: 30,  message:"Dept Name allows upto upto 30 char max"
  # validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
  #  validates_length_of :head_of_department, is: 50,  message:"Enter the Address upto 50 char max"
  # validates_length_of :manager, is:50, message:"Enter the Manager detail upto 50 char max"
  # validates_length_of :hr, is:50, message:"Enter the HR detail upto 50 char max"
  #  validates_length_of :pin_code, is: 6,  message:"Pincode Details allows max 6 digits"
  # validates_length_of :address,is:100, message:"Enter the Address upto 100 char max"
  
  
  validates :email, uniqueness: true, :presence => true
  validate  :email_regex
  
  validates :address, :presence => true, :allow_blank => true
  validate :address_regex

  def address_regex
    if address.present? and not address.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :address,"Please Enter The Correct Address"
    end
  end

  # def name_regex
  #   if name.present? and not name.match(/\A[A-Za-z0-9-_]{4,30}\Z/)
  #     errors.add :name,"Please Enter The Correct Company Name"
  #   end
  # end


  def head_of_department_regex
    if head_of_department.present? and not head_of_department.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :head_of_department,"Enter the Head Of Department upto 50 char max"
    end
  end

  def manager_regex
    if manager.present? and not manager.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :manager,"Enter the Manager detail upto 50 char max"
    end
  end

  def hr_regex
    if hr.present? and not hr.match(/\A[A-Za-z0-9-_]{4,50}\Z/)
      errors.add :hr,"Enter the HR detail upto 50 char max"
    end
  end


  def email_regex
    if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
      errors.add :email, "This is not a valid email format"
    end
   end

  def create_user_account
    department = Department.find(id)
    pass = (0...8).map { (65 + rand(26)).chr}.join
    user = Member.new do |u|
      u.email = email
      u.password = '12345678'
      u.account = department
      p "------------------------------------------------------------------"
    end
    puts pass
    if user.save
      @message = "Department Account created successfully."
      #UserPasswordMailer.welcome_email(department,pass).deliver_now
    end
    p user.errors
  end
end
