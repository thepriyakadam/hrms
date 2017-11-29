module InvestmentHeadsHelper
  def investment_head_all
   InvestmentHead.all.collect { |x| [x.section.try(:code).to_s + ' - ' + x.description.to_s, x.id] }
  end
end
