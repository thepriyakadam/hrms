class LeavRequest < ActiveRecord::Base
  belongs_to :leav_type
  belongs_to :employee
end
