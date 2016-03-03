class MonthlyExpence < ActiveRecord::Base
  belongs_to :employee
  belongs_to :expencess_type
  attr_accessor :total_amount

  validates :expence_date, :presence => true
  validates :amount, :presence => true
  validates :expence_type_id, :presence => true
  validates :employee_id, :presence => true



end
