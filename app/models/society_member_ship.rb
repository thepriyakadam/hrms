class SocietyMemberShip < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, presence: true, uniqueness: true
  # validates :is_society_member, presence: true
  validates :amount, presence: true
end
