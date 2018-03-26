module IssueLockersHelper
  def all_issue_request
    IssueRequest.all.collect { |x| [x.try(:name), x.id] }
  end
end
