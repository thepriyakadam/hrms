class CompanyLocation < ActiveRecord::Base
  protokoll :location_code, :pattern => "COMLOC###"
  belongs_to :company
  has_one :member, as: :account

  validates :name, :presence => true

  validates :city, :presence => true
  validates :district , :presence => true
  validates :contact_no , :presence => true
  validates :pin_code, :presence => true
    
  validates :email, uniqueness: true, :presence => true
  validate  :email_regex
  
  validates :address, :presence => true
  def email_regex
     if email.present? and not email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/)
       errors.add :email, "This is not a valid email format"
    end
    end
end
