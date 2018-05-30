class District < ActiveRecord::Base
  belongs_to :state
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
  has_many :capture_resumes
  has_many :employee_nominations
  has_many :pre_onboardings
  # validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.filter_records(current_user)
    @disticts =  if current_user.class == Group
    District.all
    elsif current_user.class == Member
    if current_user.role.name == "GroupAdmin"
    District.all
  elsif current_user.role.name == "Admin"
    District.all
    elsif current_user.role.name == "Branch"
    District.all
    end
  end
  end
end
