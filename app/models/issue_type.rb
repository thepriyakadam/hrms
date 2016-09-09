class IssueType < ActiveRecord::Base
	has_many :issue_masters
	validates :name, presence: true
end
