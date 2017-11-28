class IssueLockerHistory < ActiveRecord::Base
  belongs_to :issue_locker
  belongs_to :issue_request
  belongs_to :employee
end
