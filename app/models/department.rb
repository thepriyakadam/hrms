class Department < ActiveRecord::Base
  belongs_to :company_location
  belongs_to :department_type
  has_many :employees
  has_one :member, as: :account
end
