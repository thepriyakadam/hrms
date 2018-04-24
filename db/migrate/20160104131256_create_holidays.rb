class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :code
      t.string :name
      t.text :description
      t.date :holiday_date
      t.boolean :isweekend
      t.boolean :is_send, default: false
      t.boolean :c_off
      t.string  :holiday_type

      t.timestamps null: false
    end
  end
end
