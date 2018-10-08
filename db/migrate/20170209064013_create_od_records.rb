class CreateOdRecords < ActiveRecord::Migration
  def change
    create_table :od_records do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :on_duty_request, index: true, foreign_key: true
      t.date :day
      t.string :status

      t.timestamps null: false
    end
  end
end
