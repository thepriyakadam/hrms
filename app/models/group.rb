class Group < ActiveRecord::Base
	after_create :create_tenant
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def create_tenant
  	Apartment::Tenant.create(subdomain)
  end
end
