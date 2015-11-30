class Employee < ActiveRecord::Base
  protokoll :employee_code, :pattern => "EMP#######"
  belongs_to :department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  has_many :awards
  has_many :employee_leav_requests
  has_many :employee_leav_balances
  has_one :member, as: :account
  has_one :joining_detail
  accepts_nested_attributes_for :joining_detail

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :contact_no, :presence => true
  validates :adhar_no, :presence => true
  validates :pan_no, :presence => true
  validates :pin_code, :presence => true

  validates :date_of_birth, :presence => true
  validates :email, uniqueness: true, presence: true
  validate  :email_regex
  validates :permanent_address, :presence => true, :allow_blank => true
  validate :first_name_regex
  validate :last_name_regex
  validate :adhar_no_regex
  validate :state_regex
  validate :middle_name_regex
  validate :district_regex
  validate :city_regex

  #validate :pan_no_regex

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

  def state_regex
    if state.present? and not state.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :state,"State allows only Characters"
    end
  end

  def pan_no_regex
    if pan_no.present? and not pan_no.match(/^([A-Z]{5})(\d{10})([A-Z]{1})$/)
      errors.add :pan_no,"Please specify Correct Pan Card Number"
    end
  end

  def district_regex
    if district.present? and not district.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :district,"District allows only Characters"
    end
  end

  def city_regex
    if city.present? and not city.match(/\A[A-Za-z_ ]{1,30}\Z/)
      errors.add :city,"City allows only Characters"
    end
  end


  def first_name_regex
    if first_name.present? and not first_name.match(/\A[A-Za-z_]{1,30}\Z/)
      errors.add :first_name,"First Name allows only Characters"
    end
  end
# def company_name_regex
#     if name.present? and not name.match(/\A[A-Za-z0-9&_ ]{1,30}\Z/)
#       errors.add :name,"Company Name allows only Characters"
#     end
#   end
  def last_name_regex
    if last_name.present? and not last_name.match(/\A[A-Za-z_]{1,30}\Z/)
      errors.add :last_name,"Last Name Allows only Characters"
    end
  end

  def middle_name_regex
    if middle_name.present? and not middle_name.match(/\A[A-Za-z_]{1,30}\Z/)
      errors.add :middle_name,"Middle Name Allows only Characters"
    end
  end
end
