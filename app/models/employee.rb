class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :nationality
  belongs_to :blood_group
  belongs_to :employee_type
  has_one :member, as: :account
end
