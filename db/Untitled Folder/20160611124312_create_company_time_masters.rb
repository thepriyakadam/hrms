class CreateCompanyTimeMasters < ActiveRecord::Migration
  def change
    create_table :company_time_masters do |t|
      t.datetime :in_max_time
      t.datetime :out_min_time
      t.datetime :out_max_time
      t.string :working_hrs
      t.boolean :is_active
      t.boolean :is_confirm
      t.datetime :in_time
      t.datetime :out_time
      t.datetime :in_min_time
      t.string :rest_time
      t.references :shift_master, index: true, foreign_key: true
      t.boolean :time_adjust
      
      t.timestamps null: false
    end
  end
end
