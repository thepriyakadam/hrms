class MonthlyExpence < ActiveRecord::Base
  belongs_to :employee
  belongs_to :expencess_type
  attr_accessor :total_amount
end
