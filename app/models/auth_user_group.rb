class AuthUserGroup < CheckInOut
	establish_connection "#{Rails.env}_sec"
end