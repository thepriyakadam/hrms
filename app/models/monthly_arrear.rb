class MonthlyArrear < ActiveRecord::Base
  belongs_to :employee

  validates :employee_id, presence: true
   validates :day, presence: true
  validates :amount, presence: true
end
