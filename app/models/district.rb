class District < ActiveRecord::Base
  belongs_to :state
  has_many :companies
  has_many :company_locations
  has_many :employees
  has_many :families
end