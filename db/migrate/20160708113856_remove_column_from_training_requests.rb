class RemoveColumnFromTrainingRequests < ActiveRecord::Migration
  def change
  	remove_column :training_requests, :training_topic, :string
  	remove_column :training_plans, :topic, :string
  end
end
