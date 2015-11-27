class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  has_many :awards
  has_many :employee_leav_requests
  has_one :member, as: :account
  has_one :joining_detail
  accepts_nested_attributes_for :joining_detail
  after_create :create_user_account

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :contact_no, :presence => true
  validates :adhar_no, :presence => true
  validates :pan_no, :presence => true
  validates :pin_code, :presence => true
  # validates :reffernce_from, :presence =>
  
  
  validates :date_of_birth, :presence => true
  validates :email, uniqueness: true, presence: true
  validate  :email_regex
  validates :permanent_address, :presence => true, :allow_blank => true
  validate :address_regex
  validate :first_name_regex
  validate :last_name_regex
  validate :pan_no_regex
  validate :adhar_no_regex
  validate :state_regex
  validate :middle_name_regex
  validate :licence_regex
  validate :district_regex
  validate :city_regex
  # validate :ref_from_regex
  # validate :admin_hr_regex
  # validate :desig_regex
  # validate :tech_hr_regex

  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
  validates_length_of :pin_code, is:6,message:"Pin Code allows only 6 digits"


  
  validates_length_of :permanent_address,is:100, message:"Enter the Address upto 100 char max"


  def address_regex
    if permanent_address.present? and not permanent_address.match(/\A[A-Za-z0-9-_]{4,100}\Z/)
      errors.add :permanent_address,"Please Enter The Correct Address Details"
    end
  end






   def pan_no_regex
    if pan_no.present? and not pan_no.match(/^([A-Z]{5})(\d{10})([A-Z]{1})$/)
      errors.add :pan_no,"Please specify Correct Pan Card Number"
    end
  end

  def licence_regex
    if licence_no.present? and not licence_no.match(/^([A-Z]{2})([-]{1})(\d{13})$/)
      errors.add :licence_no,"Please specify Correct Pan Card Number"
    end
  end

  # def licence_regex
  #   if licence_nopresent? and not licence_no.match(/^[A-Z]{2}-[0-9]{7}$/)
  #     errors.add :licence_no,"Please specify Correct Licence Number"
  #   end
  # end



  def adhar_no_regex
    if adhar_no.present? and not adhar_no.match(/[0-9]{12}/)
      errors.add :adhar_no,"Please specify Correct Adhar Number"
    end
  end

  def email_regex
    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
      errors.add :email, "This is not a valid email format"
    end
  end

  # def email_regex
  #    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
  #      errors.add :email, "This is not a valid email format"
  #   end
  #   end 


def state_regex
    if state.present? and not state.match(/[a-zA-Z]{50}/)
      errors.add :state,"State allows only Characters"
    end
  end

def district_regex
    if district.present? and not district.match(/[a-zA-Z]{50}/)
      errors.add :district,"District allows only Characters"
    end
  end

  def city_regex
    if city.present? and not city.match(/[a-zA-Z]{50}/)
      errors.add :city,"City allows only Characters"
    end
  end

  def first_name_regex
    if first_name.present? and not first_name.match(/[a-zA-Z]{50}/)
      errors.add :first_name,"First Name allows only Characters"
    end
  end


def last_name_regex
    if last_name.present? and not last_name.match(/[a-zA-Z]{50}/)
      errors.add :last_name,"Last Name Allows only Characters"
    end
  end

  def middle_name_regex
    if middle_name.present? and not middle_name.match(/[a-zA-Z]{50}/)
      errors.add :middle_name,"Middle Name Allows only Characters"
    end
  end

#   def ref_from_regex
#     if reffernce_from.present? and not reffernce_from.match(/[a-zA-Z]{50}/)
#       errors.add :reffernce_from,"Reference From Allows only Characters"
#     end
#   end


# def admin_hr_regex
#     if admin_hr.present? and not admin_hr.match(/[a-zA-Z]{50}/)
#       errors.add :admin_hr,"Admin HR Allows only Characters"
#     end
#   end

#   def tech_hr_regex
#     if tech_hr.present? and not tech_hr.match(/[a-zA-Z]{50}/)
#       errors.add :tech_hr,"Tech HR Allows only Characters"
#     end
#   end

#    def desig_regex
#     if designation.present? and not designation.match(/[a-zA-Z]{50}/)
#       errors.add :designation,"Desigantion Allows only Characters"
#     end
#   end

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
