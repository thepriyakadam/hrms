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


def issue_tracker_member(issue_request)
      @employee = Employee.find(:id)
      @issue_tracker_member = IssueTrackerMember.where
      @issue_request = IssueRequest.find(issue_request.id)
      @emp = EmployeeResignation.find_by_employee_id(issue_request.employee_id)
      mail(to: @employee.email, subject: 'Resignation Request')
  end
end