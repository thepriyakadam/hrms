class Skillset < ActiveRecord::Base
  belongs_to :employee
  validates :name, presence: true, uniqueness: true
  validates :skill_level, presence: true, uniqueness: true
end
