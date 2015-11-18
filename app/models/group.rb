class Group < ActiveRecord::Base
	after_create :create_tenant
	has_many :companies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_tenant
  	Apartment::Tenant.create(subdomain)
  end
end
