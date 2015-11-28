class Company < ActiveRecord::Base
  belongs_to :group
  belongs_to :company_type
  has_one :member, as: :account

  validates :name, :presence => true
  validates :registration_no, :presence => true
  validates :pan_card_no, :presence => true
  validates :tax_no, :presence => true 
  validates :address, :presence => true
  validates :pan_card_no, :presence => true
  validates :professional_tax_no, :presence => true
  validates :ceo_name, :presence => true
  validates :web_site, :presence => true
  validates :starting_date, :presence => true
  validates :email, uniqueness: true, :presence => true
  validate :address_regex
  validates :contact_no, :presence => true
  validates :city, :presence => true
  validates :district, :presence => true
  validates :pin_code, :presence => true
  validates :state, :presence => true
  validate :email_regex
  validate :company_name_regex

  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"

  def address_regex
    if address.present? and not address.match(/\A[A-Za-z0-9-_ ]{4,100}\Z/)
      errors.add :address,"Please Enter The Correct Address"
    end
  end

  def company_name_regex
    if name.present? and not name.match(/\A[A-Za-z0-9-_ ]{4,50}\Z/)
      errors.add :name,"First Name allows only Characters"
    end
  end


  def email_regex
    if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
       errors.add :email, "This is not a valid email format"
    end
  end 

 def first_name_regex
    if first_name.present? and not first_name.match(/\A[A-Za-z_]{4,50}\Z/)
      errors.add :first_name,"First Name allows only Characters"
    end
  end
end






