class RemoveColFromEmployeeGpsHistory < ActiveRecord::Migration
  def change
  	remove_reference :employee_gps_histories, :member, index: true, foreign_key: true
  	add_reference :employee_gps_histories ,:employee
  	add_reference :employee_gps_histories ,:employee_gp
  end
end
