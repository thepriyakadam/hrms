class Group < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # after_create :create_tenant
  has_many :companies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:email]

  validates :email, uniqueness: true, presence: true
  validate  :email_regex

  def email_regex
    if email.present? && !email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
      errors.add :email, 'This is not a valid email format'
    end
  end

  # attr_accessor :login

  # def login=(login)
  #   @login = login
  # end

  # def login
  #   @login || self.email
  # end

  # def self.find_for_database_authentication(warden_conditions)
  #     conditions = warden_conditions.dup
  #     if login = conditions.delete(:login)
  #       where(conditions.to_h).where(["lower(email) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #     else
  #       where(conditions.to_h).first
  #     end
  #   end

  private

  # def create_tenant
  # 	Apartment::Tenant.create(subdomain)
  # end
end
