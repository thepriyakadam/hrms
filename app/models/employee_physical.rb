class EmployeePhysical < ActiveRecord::Base
  belongs_to :employee

  validates :height, presence: true
  validates :weight, presence: true
  validates :size, presence: true
end
