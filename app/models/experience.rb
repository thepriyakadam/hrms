class Experience < ActiveRecord::Base
  belongs_to :employee

  validates :no_of_year, :presence => true
  validates :company_name, :presence => true
  validates :designation, :presence => true
  
  
end
