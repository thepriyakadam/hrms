class Skillset < ActiveRecord::Base
  belongs_to :employee


  validates :name, :presence => true ,uniqueness: true
end
