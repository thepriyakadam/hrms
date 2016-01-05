module CompanyShiftsHelper
	def time_diff(start_time,end_time)
		#TimeDifference.between(start_time,end_time).in_hours
		seconds_diff = (start_time - end_time).to_i.abs

		  hours = seconds_diff / 3600
		  seconds_diff -= hours * 3600

		  minutes = seconds_diff / 60
		  seconds_diff -= minutes * 60

		  seconds = seconds_diff

		  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
	end
end
