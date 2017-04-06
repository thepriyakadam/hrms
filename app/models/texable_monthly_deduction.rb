class TexableMonthlyDeduction < ActiveRecord::Base
  belongs_to :employee
  belongs_to :salayslip
end
