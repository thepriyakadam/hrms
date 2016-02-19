class ParticularLeaveRecord < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_leav_request
end
