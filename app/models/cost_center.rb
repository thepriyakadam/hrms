class CostCenter < ActiveRecord::Base
  has_many :joining_details
  has_many :slip_informations

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
