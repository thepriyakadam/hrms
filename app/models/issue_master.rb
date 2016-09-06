class IssueMaster < ActiveRecord::Base
  belongs_to :issue_tracker_group
  belongs_to :issue_type
end
