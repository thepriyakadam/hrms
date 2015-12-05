class Certification < ActiveRecord::Base
  belongs_to :qualification

  validates :name, :presence => true
  validates :year, :presence => true
  validates :duration, :presence => true
end
