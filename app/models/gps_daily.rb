class GpsDaily < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_gp
   validates :employee_id, uniqueness: { scope: [:date] }
end
