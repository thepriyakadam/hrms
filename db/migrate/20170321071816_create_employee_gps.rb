class CreateEmployeeGps < ActiveRecord::Migration
  def change
    create_table :employee_gps do |t|
      t.references :employee
      t.float :latitude
      t.float :longitude
      t.string :location
      t.date :from_date
      t.date :to_date

      t.timestamps null: false
    end
  end
end
