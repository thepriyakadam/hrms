module DueTemplatesHelper
   def all_due_template_list
    DueTemplate.all.collect {|x| [x.code.to_s + ' - ' + x.name.to_s,x.id]}   
   end
end
