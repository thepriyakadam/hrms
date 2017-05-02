class ChangeColFromTraining < ActiveRecord::Migration
  def change
  	remove_reference :training_plans, :training_request, index: true, foreign_key: true
  	add_reference :training_plans ,:training_request
  	remove_reference :training_approvals, :training_request, index: true, foreign_key: true
  	add_reference :training_approvals ,:training_request
  	remove_reference :reporting_masters_training_reqs, :training_request, index: true, foreign_key: true
  	add_reference :reporting_masters_training_reqs ,:training_request
  	remove_reference :trainee_requests, :training_request, index: true, foreign_key: true
  	add_reference :trainee_requests ,:training_request

  	remove_reference :training_plans, :training_topic_master, index: true, foreign_key: true
  	add_reference :training_plans ,:training_topic_master
  	remove_reference :training_approvals, :training_topic_master, index: true, foreign_key: true
  	add_reference :training_approvals ,:training_topic_master
  	remove_reference :trainee_requests, :training_topic_master, index: true, foreign_key: true
  	add_reference :trainee_requests ,:training_topic_master

  	remove_reference :reporting_masters_travel_requests, :travel_request, index: true, foreign_key: true
  	add_reference :reporting_masters_travel_requests ,:travel_request
  	remove_reference :travel_request_histories, :travel_request, index: true, foreign_key: true
  	add_reference :travel_request_histories ,:travel_request
  end
end
