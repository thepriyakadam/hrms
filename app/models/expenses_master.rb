class ExpensesMaster < ActiveRecord::Base
  belongs_to :expence_opestion
  belongs_to :mode
  belongs_to :billing_option
  belongs_to :employee_grade
end
