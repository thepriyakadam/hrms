class CreateMeetingMinutes < ActiveRecord::Migration
  def change
    create_table :meeting_minutes do |t|
      t.references :employee_plan, index: true, foreign_key: true
      t.text :minutes

      t.timestamps null: false
    end
  end
end
