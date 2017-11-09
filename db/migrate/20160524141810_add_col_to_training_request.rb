class AddColToTrainingRequest < ActiveRecord::Migration
  def change
  	add_column :training_requests, :status, :string
    add_column :training_approvals, :current_status, :string
  end
end
