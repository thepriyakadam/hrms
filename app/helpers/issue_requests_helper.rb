module IssueRequestsHelper
	 def all_issue_master
    IssueMaster.all.collect { |x| [x.name, x.id] }
  end

   def all_issue_tracker_member
    IssueTrackerMember.all.collect { |x| [x.employee.first_name+''+x.employee.middle_name+''+x.employee.last_name, x.id] }
  end
end
