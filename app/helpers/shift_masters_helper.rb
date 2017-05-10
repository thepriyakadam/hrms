module ShiftMastersHelper
   
   def all_shift_type
        ShiftMaster.where(is_active: true).collect { |r| [r.name, r.id] }
    end 

end
