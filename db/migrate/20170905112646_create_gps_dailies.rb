class CreateGpsDailies < ActiveRecord::Migration
  def change
    create_table :gps_dailies do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :employee_gp, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :location
      t.date :date

      t.timestamps null: false
    end
  end
end
