class ChangeColFromTrainingRequest < ActiveRecord::Migration
  def change
  	remove_reference :employee_transfers, :reporting_master, index: true, foreign_key: true
  	add_reference :employee_transfers ,:reporting_master
  	remove_reference :training_requests, :reporting_master, index: true, foreign_key: true
  	add_reference :training_requests ,:reporting_master
  end
end
