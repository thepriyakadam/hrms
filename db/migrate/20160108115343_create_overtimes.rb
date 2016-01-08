class CreateOvertimes < ActiveRecord::Migration
  def change
    create_table :overtimes do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :ot_date
      t.string :ot_type
      t.string :ot_total_hrs
      t.string :total_production
      t.string :normal_wages_rate
      t.string :ot_wages_rate
      t.string :ot_earning
      t.date :paid_on_date
      t.text :remarks

      t.timestamps null: false
    end
  end
end
