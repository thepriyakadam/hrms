class IssueType < ActiveRecord::Base
	has_many :issue_masters
end
