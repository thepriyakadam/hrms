module IssueTrackerMembersHelper
	def all_issue_tracker_member
    IssueTrackerMember.where(status: true).all.collect { |x| [x.try(:name), x.id] }
  end
end
