module InductionDetailsHelper
  
  def all_induction_template
    InductionMaster.all.collect { |x| [x.code, x.id] }
  end

end
