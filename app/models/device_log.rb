class DeviceLog < Access
	self.table_name = "DeviceLogs_1_2018"
	establish_connection(:developent_sec)
end