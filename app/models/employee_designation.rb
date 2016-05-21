class EmployeeDesignation < ActiveRecord::Base
  has_many :joining_details
  has_many :vacancy_masters
  has_many :capture_resumes
  has_many :vacancy_request_histories

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
