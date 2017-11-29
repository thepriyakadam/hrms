class EmployeeCategory < ActiveRecord::Base
  has_many :joining_details
  has_many :employee_promotions
  has_many :promotion_histories
  validates :name, presence: true
  validates :code, presence: true
end
