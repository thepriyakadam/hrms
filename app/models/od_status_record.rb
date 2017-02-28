class OdStatusRecord < ActiveRecord::Base
  belongs_to :on_duty_request
  belongs_to :employee
  validates :on_duty_request_id, uniqueness: { scope: [:employee_id, :status] }
end
