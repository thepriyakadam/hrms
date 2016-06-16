class ExpencessType < ActiveRecord::Base
  has_many :monthly_expences
  validates :code, presence: true , uniqueness:{case_sensitive:false}
  validates :name, presence: true
end
