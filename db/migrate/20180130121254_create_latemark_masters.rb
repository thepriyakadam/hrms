class CreateLatemarkMasters < ActiveRecord::Migration
  def change
    create_table :latemark_masters do |t|
      t.time :company_time
      t.string :allow_latemark
      t.decimal :amount
      t.time :late_limit
      t.boolean :halfday_allow
      t.string :fullday_working_hrs
      t.string :halfday_working_hrs

      t.timestamps null: false
    end
  end
end
