class ParticularOdRecord < ActiveRecord::Base
  belongs_to :employee
  belongs_to :on_duty_request
end
