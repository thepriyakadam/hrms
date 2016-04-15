class Degree < ActiveRecord::Base
  has_many :qualifications
  has_many :vacancy_masters
  has_many :capture_resumes
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
