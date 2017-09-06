class GpsDaily < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_gp
end
