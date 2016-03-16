class CaptureResume < ActiveRecord::Base
   
  validates :name_of_candidate, :presence => true
  validates :post_applied, :presence => true
  validates :mode_of_application, :presence => true
  validates :date_of_application, :presence => true
  # validates :country, :presence => true
  # validates :state, :presence => true
  # validates :district, :presence => true

end
