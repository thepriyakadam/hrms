class CreatePerformancePeriods < ActiveRecord::Migration
  def change
    create_table :performance_periods do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :description
      t.boolean :is_open

      t.timestamps null: false
    end
  end
end
