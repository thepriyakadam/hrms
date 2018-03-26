class MxAtdeventTrn < ActiveRecord::Base
	self.table_name = "Mx_ATDEventTrn"
	establish_connection(:development_sec)
end