class District < ActiveRecord::Base
  belongs_to :state
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
  has_many :capture_resumes
  has_many :employee_nominations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
