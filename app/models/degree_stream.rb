class DegreeStream < ActiveRecord::Base
  has_many :qualifications

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
