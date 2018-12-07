class ShortLeaveRequest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
end
