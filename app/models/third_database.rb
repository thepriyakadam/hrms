class ThirdDatabase < ActiveRecord::Base
  self.table_name = "Mx_ATDEventTrn" 
  establish_connection "#{Rails.env}_thi"
end
