module IssueMastersHelper
	
  def all_issue_types
    IssueType.where(status: true).all.collect { |x| [x.name, x.id] }
  end

end
