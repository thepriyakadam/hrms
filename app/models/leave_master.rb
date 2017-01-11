class LeaveMaster < ActiveRecord::Base
  belongs_to :leav_category
  validates :leav_category_id, presence: true,uniqueness: { case_sensitive: false }
end
