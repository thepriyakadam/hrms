class EmployeePlan < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode

  class << self

  	def check_availability(current_user, from_date_now, to_date_now, from_time, to_time)
  		# from_date = from_date.to_date.strftime("%d-%m-%Y")
  		# to_date = to_date.to_date.strftime("%d-%m-%Y")
  		time = from_time.to_time.strftime("%H:%M:%S").to_s
  		defult = "2000-01-01 "
  		from_time_now = defult + time
  		time = to_time.to_time.strftime("%H:%M:%S").to_s
  		to_time_now = defult + time
  		binding.pry
  		byebug
  		abc = EmployeePlan.select(EmployeePlan.arel_table[Arel.star]).where(EmployeePlan.arel_table[:employee_id].eq(:current_user).and(EmployeePlan.arel_table[:from_date].eq(:from_date_now).or(EmployeePlan.arel_table[:to_date].eq(:from_date_now)).and(EmployeePlan.arel_table[:from_date].eq(:from_date_now).or(EmployeePlan.arel_table[:to_date].eq(:to_date_now)).and(EmployeePlan.arel_table[:from_time].gteq(:from_time_now).and(EmployeePlan.arel_table[:to_time].lteq(:from_time_now)).and(EmployeePlan.arel_table[:from_time].gteq(:to_time_now).and(EmployeePlan.arel_table[:to_time].lteq(:to_time_now)))))))
  		# @employee_plan = EmployeePlan.where(employee_id: current_user.employee_id)
  		# employee_plan = @employee_plan.where(from_date: from_date.to_date, to_date: to_date.to_date)
  		# if employee_plan.present?
  		# 	binding.pry
  		# 	byebug
  		# 	time = employee_plan.select(EmployeePlan.arel_table[Arel.star]).where(EmployeePlan.arel_table[:from_time].gteq(from_time_now).and(EmployeePlan.arel_table[:to_time].lteq(from_time_now)))
 			# if time.present?
 			# 	flash[:notice] = 'This time are already reserved...'
 			# else
		
  		# 	end
  		# end
	end
  end
end
