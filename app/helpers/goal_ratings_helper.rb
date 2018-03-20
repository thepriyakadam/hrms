module GoalRatingsHelper
	def goal_confirm(e,period)
		GoalBunch.find_by_employee_id_and_period_id_and_goal_confirm(e.id,period, true).nil?
  end
	
end
