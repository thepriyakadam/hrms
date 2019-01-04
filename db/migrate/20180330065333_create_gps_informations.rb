class CreateGpsInformations < ActiveRecord::Migration
  def change
    create_table :gps_informations do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.float :longitude
      t.float :latitude
      t.string :place
      t.float :radius

      t.timestamps null: false
    end
  end
end
