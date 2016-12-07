module IssueTrackerGroupsHelper
	def all_issue_tracker_group
    IssueTrackerGroup.where(status: true).all.collect { |x| [x.try(:name), x.id] }
  end
end
