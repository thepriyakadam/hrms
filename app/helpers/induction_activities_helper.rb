module InductionActivitiesHelper
  

 def all_induction_template
    InductionTemplate.all.collect { |x| [x.code, x.id] }
  end

end
