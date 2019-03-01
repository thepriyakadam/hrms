class ShortLeaveApproval < ActiveRecord::Base
  belongs_to :short_leave_request
  belongs_to :employee
end
