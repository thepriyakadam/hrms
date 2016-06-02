module GoalBunchesHelper
	def all_period_type
		Period.all.collect { |p| [p.name.to_s+' '+p.from.to_s+' '+p.to.to_s, p.id]}
	end
	def all_employee_list
    Employee.all.collect { |e| [e.try(:manual_employee_code).to_s + ' ' + e.try(:first_name).to_s + ' ' + e.try(:last_name).to_s, e.id] }
  end
  def all_rating_type
  	Rating.all.collect {|r| [r.value, r.id]}
  end
end
