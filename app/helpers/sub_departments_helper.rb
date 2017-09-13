module SubDepartmentsHelper

   def all_sub_department
       SubDepartment.all.collect { |x| [x.name, x.id] }
    end
end
