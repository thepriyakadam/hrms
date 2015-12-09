class Certification < ActiveRecord::Base
  belongs_to :employee

  validates :name, :presence => true
 
  validates :duration, :presence => true
end
