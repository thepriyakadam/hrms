class Access < ActiveRecord::Base
	self.abstract_class = true
	#establish_connection("development_sec")
	establish_connection "#{Rails.env}_sec"
end
