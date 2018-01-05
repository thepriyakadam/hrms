class Access < ActiveRecord::Base
	self.abstract_class = true
	# self.table_name = "Mx_ATDEventTrn"
	# self.table_name = "Mx_ATDEventTrn"
	establish_connection "#{Rails.env}_sec"
end