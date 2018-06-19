class CreateEmployeeLocationHistories < ActiveRecord::Migration
  def change
    create_table :employee_location_histories do |t|
      t.references :employee, index: true, foreign_key: true
      t.datetime :date_time
      t.float :latitude
      t.float :longitude
      t.string :location

      t.timestamps null: false
    end
  end
end
