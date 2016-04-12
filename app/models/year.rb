class Year < ActiveRecord::Base
  has_many :qualifications
  has_many :certifications
  has_many :awards
end
