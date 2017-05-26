class RemoveColFromRewardRecognitions < ActiveRecord::Migration
  def change
  	remove_column :reward_recognitions, :type, :string
  	add_column :reward_recognitions, :r_type, :string
  end
end
