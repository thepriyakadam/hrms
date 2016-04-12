class AttributeMaster < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :employee_attributes
  has_many :attribute_rating_sheets
end
