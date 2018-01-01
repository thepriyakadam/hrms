class CreateEmployeeLocationHistories < ActiveRecord::Migration
  def change
    create_table :employee_location_histories do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.float :latitude
      t.float :longitude
      t.text :location

      t.timestamps null: false
    end
  end
end
