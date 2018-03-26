class CreateLatemarkTotals < ActiveRecord::Migration
  def change
    create_table :latemark_totals do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :latemark_date
      t.time :in_time

      t.timestamps null: false
    end
  end
end
