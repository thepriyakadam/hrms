class ApprovalProcess < ActiveRecord::Base
  belongs_to :membership

  validates :membership_id, presence:true ,uniqueness:{case_sensitive:false}
end
