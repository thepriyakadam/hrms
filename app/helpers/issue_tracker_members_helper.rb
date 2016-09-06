module IssueTrackerMembersHelper
	def all_issue_tracker_group
    IssueTrackerGroup.all.collect { |x| [x.try(:name), x.id] }
  end
end
