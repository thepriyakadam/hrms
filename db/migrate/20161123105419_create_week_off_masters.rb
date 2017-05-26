class CreateWeekOffMasters < ActiveRecord::Migration
  def change
    create_table :week_off_masters do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :day
      t.boolean :is_active
      t.boolean :is_send
      t.date :from
      t.date :to

      t.boolean :is_prefix

      t.timestamps null: false
    end
  end
end
