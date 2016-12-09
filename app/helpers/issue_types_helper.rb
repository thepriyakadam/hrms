module IssueTypesHelper

	def all_issue_master
    IssueMaster.where(status: true).all.collect { |x| [x.name, x.id] }
  end

end
