class State < ActiveRecord::Base
  belongs_to :country
  has_many :districts
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
  has_many :capture_resumes
  has_many :employee_nominations
end
