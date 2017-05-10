module InvestmentHeadsHelper
  def investment_head_all
   InvestmentHead.all.collect { |x| [x.description, x.id] }
  end
end
