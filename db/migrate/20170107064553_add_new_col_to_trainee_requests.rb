class AddNewColToTraineeRequests < ActiveRecord::Migration
  def change
    add_column :trainee_requests, :training_plan, :boolean
  end
end
