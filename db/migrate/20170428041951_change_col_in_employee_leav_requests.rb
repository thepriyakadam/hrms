class ChangeColInEmployeeLeavRequests < ActiveRecord::Migration
  def change
  	# remove_reference :employee_leav_requests, :first_reporter, index: true, foreign_key: true
  	# remove_reference :employee_leav_requests, :second_reporter, index: true, foreign_key: true

  	# add_reference :employee_leav_requests ,:first_reporter
  	# add_reference  :employee_leav_requests ,:second_reporter
  end
end
