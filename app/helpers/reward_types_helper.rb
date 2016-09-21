module RewardTypesHelper
  def all_reward_type
    RewardType.all.collect { |x| [x.name, x.id] }
  end
end
