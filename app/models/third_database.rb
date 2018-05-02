class ThirdDatabase < ActiveRecord::Base
  self.table_name = "AtdRecord"
  establish_connection "#{Rails.env}_thi"
end
