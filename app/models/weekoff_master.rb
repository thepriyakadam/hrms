class WeekoffMaster < ActiveRecord::Base
	def self.day(date)
		no_of_day = 0
		WeekoffMaster.all.each do |w|
			start_date = date.beginning_of_month
			end_date = date.end_of_month
			str = w.day.downcase+"?"
			amount = start_date.step(end_date).select{|d| d.send(str.to_sym)}.size
			no_of_day = no_of_day + amount
		end
		no_of_day
	end
end
