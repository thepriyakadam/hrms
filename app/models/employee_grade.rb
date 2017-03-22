class EmployeeGrade < ActiveRecord::Base
  has_many :joining_details
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :employee_promotions
  has_many :promotion_histories
end
