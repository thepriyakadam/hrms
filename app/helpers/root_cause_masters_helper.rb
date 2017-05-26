module RootCauseMastersHelper

   def all_root_cause_list
    RootCauseMaster.all.collect { |x| [x.name, x.id] }
   end
   
end
