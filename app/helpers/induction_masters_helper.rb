module InductionMastersHelper
  def all_induction_template
    InductionMaster.all.collect { |x| [x.code, x.id] }
  end

   def all_induction_template2
    InductionMaster.all.collect {|x| [x.code.to_s + ' - ' + x.description.to_s,x.id]}   
   end
end
