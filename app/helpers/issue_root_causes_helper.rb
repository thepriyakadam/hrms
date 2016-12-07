module IssueRootCausesHelper

	def all_issue_root_cause
    IssueRootCause.where(status: true).all.collect { |x| [x.name, x.id] }
  end
end
