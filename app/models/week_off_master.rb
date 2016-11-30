class WeekOffMaster < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, presence: true
end
