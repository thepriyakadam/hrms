class Family < ActiveRecord::Base
  belongs_to :employee
  belongs_to :nationality

  validates :relation, :presence => true
  validates :f_name, :presence => true
  validates :l_name , :presence => true
  # validates_length_of :pin_code, is: 6,  message:"Please Enter 6 digit"
  # validates_length_of :adhar_no, is: 12, message:"Please Enter 12 digit"
  # validates_length_of :age, within: 2..3, message:"Enter the Correct Age Details"
  
  validates :email, uniqueness: true
  validate  :email_regex
  validate  :no_of_member_regex
   validate :first_name_regex
  validate :last_name_regex
  validate :middle_name_regex
  validate :state_regex
  validate :district_regex
  validate :city_regex
  validate :address_regex

  def address_regex
    if permanent_address.present? and not permanent_address.match(/\A[A-Za-z0-9-_ ]{4,50}\Z/)
      errors.add :permanent_address,"Please Enter The Correct Address"
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
