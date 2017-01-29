class EmployeeType < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
