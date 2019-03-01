class LeavCategory < ActiveRecord::Base
  has_many :company_leavs
  has_many :employee_leav_requests
  has_many :employee_leav_balances
  has_many :particular_leave_records
  has_many :leave_details
  has_many :leave_records
  has_many :leave_transfers
  has_many :short_leave_requests

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
