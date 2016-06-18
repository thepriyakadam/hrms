class SalaryCompMapping < ActiveRecord::Base
  belongs_to :salary_component
  validates :salary_component_id, presence: true, uniqueness: { case_sensitive: false }
end