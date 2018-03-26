class CreateEmployeeGpsHistories < ActiveRecord::Migration
  def change
    create_table :employee_gps_histories do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :employee_gp, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :location
      t.date :from_date
      t.date :to_date

      t.timestamps null: false
    end
  end
end