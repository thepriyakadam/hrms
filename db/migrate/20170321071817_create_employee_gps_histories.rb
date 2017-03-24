class CreateEmployeeGpsHistories < ActiveRecord::Migration
  def change
    create_table :employee_gps_histories do |t|
      t.references :member, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :location
      t.date :from_date
      t.date :to_date

      t.timestamps null: false
    end
  end
end