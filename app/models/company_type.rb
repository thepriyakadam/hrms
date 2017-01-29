class CompanyType < ActiveRecord::Base
  has_many :companies
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
