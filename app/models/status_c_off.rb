class StatusCOff < ActiveRecord::Base
  belongs_to :leave_c_off
  belongs_to :employee
end
