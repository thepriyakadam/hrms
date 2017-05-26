class AddColToTrainingRequests < ActiveRecord::Migration
  def change
    add_column :training_requests, :no_of_employee, :integer
    add_column :training_requests, :place, :string
    add_column :training_requests, :justification, :text
  end
end
