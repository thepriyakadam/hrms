class Member < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  belongs_to :company
  belongs_to :company_location
  belongs_to :department
  belongs_to :role
  belongs_to :member
  belongs_to :employee
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates_format_of :member_code, with: /^[a-zA-Z0-9_\.]*$/
  validates :email, uniqueness: true, presence: true
  validate  :email_regex

  #attr_accessor :login

  def email_regex
    if email.present? and not email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
      errors.add :email, "This is not a valid email format"
    end
  end

  # def login=(login)
  #   @login = login
  # end

  # def login
  #   @login || self.member_code || self.email
  # end

  # def self.find_for_database_authentication(warden_conditions)
  #     conditions = warden_conditions.dup
  #     if login = conditions.delete(:login)
  #       where(conditions.to_h).where(["lower(member_code) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #     else
  #       where(conditions.to_h).first
  #     end
  #   end
end
