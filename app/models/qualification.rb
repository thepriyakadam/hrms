class Qualification < ActiveRecord::Base
  belongs_to :employee
  validates :college, :presence => true
end
