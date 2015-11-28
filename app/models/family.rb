class Family < ActiveRecord::Base
  belongs_to :employee
  belongs_to :nationality

  validates :no_of_member, :presence => true
  validates :f_name, :presence => true
  validates :l_name , :presence => true
  validates :date_of_birth, :presence => true
  validates :contact_no, :presence => true
  validates :adhar_no, :presence => true
  validates :relation, :presence => true
  validates_length_of :pin_code, is: 6,  message:"Please Enter 6 digit"
  validates_length_of :adhar_no, is: 12, message:"Please Enter 12 digit"
 
  validates_length_of :age, within: 2..3, message:"Enter the Correct Age Details"
  
  validates :email, uniqueness: true
  validate  :email_regex
  validate  :no_of_member_regex
   validate :first_name_regex
  validate :last_name_regex
  validate :middle_name_regex
  validate :state_regex
  validate :district_regex
  validate :city_regex
  validate :email_regex
  validate :relation_regex
  validate :adhar_no_regex
  validate :pan_no_regex
  validate :religion_regex
  validate :profession_regex

  validates :permanent_address, :presence => true, :allow_blank => true
  validate :address_regex

  def address_regex
    if permanent_address.present? and not permanent_address.match(/\A[A-Za-z0-9-_]{4,100}\Z/)
      errors.add :permanent_address,"Please Enter The Correct Address"
    end
  end

  def adhar_no_regex
    if adhar_no.present? and not adhar_no.match(/[0-9]{12}/)
      errors.add :adhar_no,"Please specify Correct Adhar Number"
    end
  end

  def religion_regex
    if religion.present? and not religion.match(/[a-zA-Z]{50}/)
      errors.add :religion,"Religion allows only Characters"
    end
  end

  def profession_regex
    if profession.present? and not profession.match(/[a-zA-Z]{30}/)
      errors.add :profession,"Profession allows only Characters"
    end
  end

def pan_no_regex
    if pan_no.present? and not pan_no.match(/^([A-Z]{5})(\d{10})([A-Z]{1})$/)
      errors.add :pan_no,"Please specify Correct Pan Card Number"
    end
  end

  def email_regex
    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
      errors.add :email, "This is not a valid email format"
    end
  end

  def current_address_regex
    if current_addresscurrent_addresscurrent_address.present? and not current_address.match(/\A[A-Za-z0-9-_]{4,100}\Z/)
      errors.add :current_addresscurrent_address,"Please Enter The Correct Address Details"
    end
  end

  def contact_no_regex
    if permanent_address.present? and not permanent_address.match(/^[0-9-]{13}/)
      errors.add :permanent_address,"Please Enter The Correct Address Details"
    end
  end


def no_of_member_regex
    if no_of_member.present? and not no_of_member.match(/[0-9]{4}/)
      errors.add :no_of_member,"No of members allow only digits"
    end
  end


  def first_name_regex
    if f_name.present? and not f_name.match(/[a-zA-Z]{50}/)
      errors.add :f_name,"First Name allows only Characters"
    end
  end

  def relation_regex
    if relation.present? and not relation.match(/[a-zA-Z]{30}/)
      errors.add :relation,"Relation Allows Only Characters"
    end
  end


def last_name_regex
    if l_name.present? and not l_name.match(/[a-zA-Z]{50}/)
      errors.add :l_name,"Last Name Allows only Characters"
    end
  end

  def middle_name_regex
    if m_name.present? and not m_name.match(/[a-zA-Z]{50}/)
      errors.add :m_name,"Middle Name Allows only Characters"
    end
  end


def state_regex
    if state.present? and not state.match(/[a-zA-Z]{50}/)
      errors.add :state,"State allows only Characters"
    end
  end

def district_regex
    if dist.present? and not dist.match(/[a-zA-Z]{50}/)
      errors.add :dist,"District allows only Characters"
    end
  end

  def city_regex
    if city.present? and not city.match(/[a-zA-Z]{50}/)
      errors.add :city,"City allows only Characters"
    end
  end

  def email_regex
    if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
      errors.add :email, "This is not a valid email format"
    end
   end
end
