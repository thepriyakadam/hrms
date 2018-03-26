class VacancyRequest < ActiveRecord::Base
  belongs_to :request_by
  belongs_to :approval_by
  belongs_to :employee_designation
  belongs_to :department
  belongs_to :recruiter

  has_many :vacancy_request_statuses
  has_many :candidate_forms
end
