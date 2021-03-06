class EmployeePlan < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
  belongs_to :plan_reason_master
  has_many :listed_companies
  has_many :meeting_follow_ups
  has_many :travel_requests
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode

  class << self

  	def check_availability(current_user, from_date_now, to_date_now, from_time, to_time)
  		from_time = from_time.to_time.strftime("%H:%M")
      to_time = to_time.to_time.strftime("%H:%M")
      @employee_plans = EmployeePlan.where(employee_id: current_user.employee_id).where.not(current_status: "Cancelled").where.not(current_status: "Rejected")
  		employee_plan = @employee_plans.where(from_date: from_date_now.to_date, to_date: to_date_now.to_date)
  		if employee_plan.present?
  		  if from_plan = employee_plan.where("? BETWEEN from_time AND to_time", from_time).present?
  		   	plan = from_plan
 			  else to_plan = employee_plan.where("? BETWEEN from_time AND to_time", to_time).present?
		      plan = to_plan
        end
  		end
      return plan
	  end
  end
end
