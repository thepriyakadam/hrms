class IssueRequestMailer < ApplicationMailer
	
 #  def issue_tracker_group_email(issue_request)
 #  	  @issue_request = issue_request
 #  	  @issue_request = IssueRequest.find(issue_request.id)
 #  	  @issue_tracker_group = IssueTrackerGroup.find(issue_request.issue_tracker_group_id)
 #      mail(to: @issue_tracker_group.email, subject: 'Issue Request')
 #  end

 # def issue_resend(issue_request)
 #  	  @issue_request = issue_request
 #  	  @issue_request = IssueRequest.find(issue_request.id)
 #  	  @issue_tracker_group = IssueTrackerGroup.find(issue_request.issue_tracker_group_id)
 #      mail(to: @issue_tracker_group.email, subject: 'Issue Request')
 #  end


# def issue_tracker_member_email(issue_request)
#   @issue_request = issue_request
#   @issue_tracker_member = IssueTrackerMember.find(@issue_request.issue_tracker_group_id)
#   @employee = Employee.find(@issue_request.employee_id)
#   @issue_tracker_group = IssueTrackerGroup.find(@issue_request.employee_id)
#   mail(to: @issue_tracker_member.email, subject: 'Support Request')
# end
def issue_tracker_group_email(mail_id, request, c1, c2)
  @issue_request = request
  @c1 = c1
  @c2 = c2
  mail(to: mail_id, subject: 'Support Request') 
end
  # def issue_tracker_group_email(s)
  # 	s=s
  #   mail(to: s, subject: 'Support Request')
  # end
end
