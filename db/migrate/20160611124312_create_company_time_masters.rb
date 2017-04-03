class CreateCompanyTimeMasters < ActiveRecord::Migration
  def change
    create_table :company_time_masters do |t|
      t.time :in_min_time
      t.time :in_max_time
      t.time :out_min_time
      t.time :out_max_time
      t.decimal :working_hrs
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
