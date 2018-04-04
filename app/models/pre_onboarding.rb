class PreOnboarding < ActiveRecord::Base
  belongs_to :selected_resume
  belongs_to :country
  belongs_to :state
  belongs_to :district
end
