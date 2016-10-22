module IssueRequestReportHelper

	def issue_request_id
		IssueRequest.all.collect { |x| [x.id] }
	end 
end
