class CreateAccidentRecords < ActiveRecord::Migration
  def change
    create_table :accident_records do |t|
      t.string :code
      t.references :employee, index: true, foreign_key: true
      t.date :accident_date
      t.string :esic_no
      t.string :case_type
      t.string :type_of_injury
      t.string :leave_date_range
      t.string :no_of_day
      t.text :description
      t.references :root_cause_master, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
