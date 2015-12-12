class State < ActiveRecord::Base
  belongs_to :country
  has_many :districts
  has_many :companies
end
