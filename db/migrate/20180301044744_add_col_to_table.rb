class AddColToTable < ActiveRecord::Migration
  def change
  	 # add_reference :access_issue_requests, :issue_tracker_member, index: true, foreign_key: true
  	 # add_column :daily_attendances, :latitude, :decimal
  	 # add_column :daily_attendances, :longitude, :decimal
  	 # add_column :daily_attendances, :place, :text
  	 # add_column :daily_attendances, :comment, :text
  	 # add_reference :daily_bill_details, :currency_master, index: true, foreign_key: true
  	 # add_reference :employee_gps_histories, :employee, index: true, foreign_key: true
  	 # add_reference :employee_gps_histories, :employee_gp, index: true, foreign_key: true
  	 # add_column :employee_grades, :is_confirm, :boolean
  	 # add_column :employee_shifts, :from_date, :date
  	 # add_column :employee_shifts, :to_date, :date
  	 # add_column :goal_ratings, :activity, :text
  	 # add_reference :issue_tracker_accesses, :issue_tracker_member, index: true, foreign_key: true
  	 add_column :leave_records, :is_confirm, :boolean
  	 add_column :slip_informations, :cl, :decimal
  	 add_column :slip_informations, :el, :decimal
  	 add_column :slip_informations, :c_off, :decimal
  	 add_column :slip_informations, :advance, :decimal
  	 
  end
end
