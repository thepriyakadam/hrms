class DeviceLog < Access
	self.table_name = "PunchTimeDetails"
	establish_connection(:developent_sec)
end