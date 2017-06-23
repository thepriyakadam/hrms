class Recruiter < ActiveRecord::Base
  belongs_to :employee
  has_many :vacancy_requests
  validates :employee_id, presence: true,  uniqueness: { case_sensitive: false }
end
