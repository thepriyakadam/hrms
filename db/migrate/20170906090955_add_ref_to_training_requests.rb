class AddRefToTrainingRequests < ActiveRecord::Migration
  def change
  	remove_reference :training_requests, :reporting_masters, index: true, foreign_key: true
    add_reference :training_requests, :reporting_masters
  end
end
