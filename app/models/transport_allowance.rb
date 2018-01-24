class TransportAllowance < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, presence: true, uniqueness: true
  validates :amount, presence: true
end
