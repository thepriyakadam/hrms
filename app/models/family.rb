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
  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
  
  validates :email, uniqueness: true
  validate  :email_regex
  
  validates :permanent_address, :presence => true, :allow_blank => true
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
end
