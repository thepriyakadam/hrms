class AddNewColumnToTraineeRequests < ActiveRecord::Migration
  def change
    add_reference :trainee_requests, :training_topic_master, index: true, foreign_key: true
    add_column :trainee_requests, :is_complete, :boolean
  end
end
