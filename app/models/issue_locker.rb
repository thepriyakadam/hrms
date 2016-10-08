class IssueLocker < ActiveRecord::Base
  belongs_to :issue_request
  belongs_to :employee
end
