class Religion < ActiveRecord::Base
  has_many :employees
  has_many :families

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
