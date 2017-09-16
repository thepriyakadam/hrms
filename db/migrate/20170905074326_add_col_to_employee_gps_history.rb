class AddColToEmployeeGpsHistory < ActiveRecord::Migration
  def change
    add_reference :employee_gps_histories, :member, index: true, foreign_key: true
  end
end
