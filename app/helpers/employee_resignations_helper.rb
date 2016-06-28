module EmployeeResignationsHelper
  def all_leaving_reason
	LeavingReason.all.collect { |t| [t.name, t.id] }
  end

 end