class DepartmentType < ActiveRecord::Base
  has_many :departments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
