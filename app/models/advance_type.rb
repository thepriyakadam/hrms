class AdvanceType < ActiveRecord::Base
  has_many :advance_salaries

  validates :code, presence: true,  uniqueness: { case_sensitive: false }
  validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
