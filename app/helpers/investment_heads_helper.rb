module InvestmentHeadsHelper

   def section_all
   Section.all.collect { |x| [x.code, x.id] }
  end
end
