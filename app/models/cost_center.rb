class CostCenter < ActiveRecord::Base
  has_many :joining_details
  has_many :slip_informations
  has_many :vacancy_masters
  has_many :employees

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
