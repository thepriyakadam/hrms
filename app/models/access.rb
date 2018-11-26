class Access < ActiveRecord::Base

#self.abstract_class = true
 	self.table_name = "tcp_trans"
 	establish_connection "#{Rails.env}_sec"
end
