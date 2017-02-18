class OdStatusRecord < ActiveRecord::Base
  belongs_to :on_duty_request
  belongs_to :employee
end
