class Certification < ActiveRecord::Base
  belongs_to :employee
  belongs_to :year
  validates :name, presence: true
  validates :duration, presence: true
end
