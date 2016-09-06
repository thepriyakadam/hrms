module IssueMastersHelper
	
  def all_issue_types
    IssueType.all.collect { |x| [x.name, x.id] }
  end

end
