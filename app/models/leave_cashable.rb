class LeaveCashable < ActiveRecord::Base
  belongs_to :employee
  belongs_to :leav_category
end
