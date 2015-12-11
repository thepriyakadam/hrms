class Employee < ActiveRecord::Base
  protokoll :employee_code, :pattern => "EMP#######"
  belongs_to :department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  has_many :awards
  has_many :certifications
  has_many :qualifications
  has_many :employee_leav_requests
  has_many :employee_leav_balances
  has_one :member
  has_one :employee_bank_detail
  has_one :joining_detail
  accepts_nested_attributes_for :joining_detail
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee"

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :contact_no, :presence => true
  validate  :email_regex
  validates :permanent_address, :presence => true
  validate :last_name_regex
  validate :adhar_no_regex
  validate :middle_name_regex
 
  validate :pan_no_regex

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

  def pan_no_regex
    if pan_no.present? and not pan_no.match(/^([A-Z]{5})(\d{4})([A-Z]{1})$/)
      errors.add :pan_no,"Please specify Correct Pan Card Number"
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
