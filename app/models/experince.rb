class Experince < ActiveRecord::Base
  belongs_to :employee

  validates :no_of_year_experince, :presence => true
  validates :company_name, :presence => true
  validates :designation, :presence => true
  validates :ctc, :presence => true
end
