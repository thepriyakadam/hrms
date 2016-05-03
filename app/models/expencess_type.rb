class ExpencessType < ActiveRecord::Base
  has_many :monthly_expences
  validates :code, presence: true
  validates :name, presence: true
end
