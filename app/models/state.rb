class State < ActiveRecord::Base
  belongs_to :country
  has_many :districts
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
  has_many :capture_resumes
  has_many :employee_nominations
  has_many :pre_onboardings
  # validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def self.filter_records(current_user)
    @countries =  if current_user.class == Group
    Country.all
    elsif current_user.class == Member
    if current_user.role.name == "GroupAdmin"
    Country.all
    elsif current_user.role.name == "Admin"
    Country.all
    elsif current_user.role.name == "Branch"
    Country.all
    end
  end
  end
end
