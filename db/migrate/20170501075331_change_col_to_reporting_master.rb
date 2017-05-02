class ChangeColToReportingMaster < ActiveRecord::Migration
  def change
  	remove_reference :trainee_requests, :reporting_master, index: true, foreign_key: true
  	add_reference :trainee_requests ,:reporting_master
  	remove_reference :reporting_masters_training_reqs, :reporting_master, index: true, foreign_key: true
  	add_reference :reporting_masters_training_reqs ,:reporting_master
  	remove_reference :training_approvals, :reporting_master, index: true, foreign_key: true
  	add_reference :training_approvals ,:reporting_master
  	remove_reference :reporting_employee_transfers, :reporting_master, index: true, foreign_key: true
  	add_reference :reporting_employee_transfers ,:reporting_master
  	remove_reference :transfer_histories, :reporting_master, index: true, foreign_key: true
  	add_reference :transfer_histories ,:reporting_master
  	remove_reference :daily_bill_details, :reporting_master, index: true, foreign_key: true
  	add_reference :daily_bill_details ,:reporting_master
  	remove_reference :reporting_masters_vacancy_masters, :reporting_master, index: true, foreign_key: true
  	add_reference :reporting_masters_vacancy_masters ,:reporting_master
  end
end