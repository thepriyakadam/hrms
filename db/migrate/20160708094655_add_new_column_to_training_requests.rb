class AddNewColumnToTrainingRequests < ActiveRecord::Migration
  def change
    add_column :training_requests, :comment, :text
  end
end
