class InvestmentDeclaration < ActiveRecord::Base
  belongs_to :investment_head
  belongs_to :employee
end
