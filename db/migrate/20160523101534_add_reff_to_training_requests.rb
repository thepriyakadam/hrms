class AddReffToTrainingRequests < ActiveRecord::Migration
  def change
    add_reference :training_requests, :training_topic_master, index: true, foreign_key: true
  end
end
