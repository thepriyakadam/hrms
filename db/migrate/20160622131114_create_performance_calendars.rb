class CreatePerformanceCalendars < ActiveRecord::Migration
  def change
    create_table :performance_calendars do |t|
      t.references :period, index: true, foreign_key: true
      t.references :performance_activity, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
