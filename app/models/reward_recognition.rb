class RewardRecognition < ActiveRecord::Base
  belongs_to :reward_type
  belongs_to :reward_owner
end
