module RewardOwnersHelper
  def all_reward_owner
    RewardOwner.all.collect { |x| [x.name, x.id] }
  end
end
