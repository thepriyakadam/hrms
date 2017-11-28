class Degree < ActiveRecord::Base
  has_many :qualifications
  has_many :vacancy_masters
  has_many :capture_resumes
  has_many :selected_resumes
  has_many :vacancy_request_histories
  # validates :name, presence: true, uniqueness: { case_sensitive: false }

 has_many :candidate_forms
end
