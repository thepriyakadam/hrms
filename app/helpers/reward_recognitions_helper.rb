module RewardRecognitionsHelper

  def all_reward_type
    RewardType.all.collect { |x| [x.name, x.id] }
  end

   def all_reward_owner
    RewardOwner.all.collect { |x| [x.name, x.id] }
  end

end
