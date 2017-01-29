module IssueRequestsHelper
	 def all_issue_master
    IssueMaster.where(status: true).all.collect { |x| [x.name, x.id] }
  end

   def all_issue_tracker_member
     IssueTrackerMember.where(status: true).all.collect { |x| [x.employee.first_name+' '+x.employee.middle_name+' '+x.employee.last_name, x.id] }
  end

  def issue_tracker_member_role_wise(i)
     IssueTrackerMember.where(status: true,issue_tracker_group_id: i).collect { |x| [x.employee.first_name+' '+x.employee.middle_name+' '+x.employee.last_name, x.id] }
  end
end
