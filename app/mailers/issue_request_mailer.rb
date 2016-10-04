class IssueRequestMailer < ApplicationMailer
	
  def issue_tracker_group_email(issue_request)
  	  @issue_request = issue_request
  	  @issue_request = IssueRequest.find(issue_request.id)
  	  @issue_tracker_group = IssueTrackerGroup.find(issue_request.issue_tracker_group_id)
      mail(to: @issue_tracker_group.email, subject: 'Issue Request')
  end

 def issue_resend(issue_request)
  	  @issue_request = issue_request
  	  @issue_request = IssueRequest.find(issue_request.id)
  	  @issue_tracker_group = IssueTrackerGroup.find(issue_request.issue_tracker_group_id)
      mail(to: @issue_tracker_group.email, subject: 'Issue Request')
  end

end