class MonthlyExpence < ActiveRecord::Base
  belongs_to :employee
  belongs_to :expencess_type
  attr_accessor :total_amount

  validates :employee_id, presence: true
  validates :expencess_type_id, presence: true
  validates :expence_date, presence: true
  validates :amount, presence: true
end
